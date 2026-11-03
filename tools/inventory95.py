#!/usr/bin/env python3
"""Inventory for the alignment moves: every global label in the source, grouped into routines, with a proposed folder.

    python3 tools/inventory95.py --g95 ../NHL95Genesis --s94 ../NHL94SNES [--out docs/routines95s.csv] [--summary FILE]

Needs a build first (./build.sh writes output/nhl95snes.sym, the label addresses). Reads the source files that
src/nhl95snes.asm includes, in ROM order.

A routine is a run of global labels that falls through: a label whose code does not end in rts / rtl / rti / jmp / jml /
bra / brl joins the label after it, so the run moves as one file named after its first label. A label whose first line
is data (db, dw, dl, incbin, fill...) is a data row: it goes to src/data/ in step 3c, not to src/routines/.

The folder of a routine (docs/RULES.md "This repo"), first rule that applies:
  95G      a label of the run is a NHL95Genesis label: that 95G file (engine/collide, front/season, hockey, ...)
  94S      a label of the run is a NHL94SNES routine: the 94S folder, under its 95G group when 95G has a file of that name
           (video -> engine/video, main -> main), else as is (sound, decompress)
  callers  the folder most of its callers (jsl / jsr / jml / jmp) are in, repeated until nothing changes
  UNSURE   none of these; placed by the owner at checkpoint 1
Columns: address, size, kind (code / data), head (the routine's file name), label, callers, name_source (the
name_map.csv source tag), folder, rule, evidence.
"""
import argparse, collections, csv, glob, os, re, sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = os.path.join(ROOT, 'src')
LBL = re.compile(r'^([A-Za-z_]\w*):(.*)')    # asar labels end in ':' (org, check, arch lines do not)
NOEMIT = re.compile(r'^\s*(=|equ\b|macro\b)', re.I)
INCSRC = re.compile(r'^\s*incsrc\s+"([^"]+)"', re.I)
DATA = re.compile(r'^\s*(db|dw|dl|dd|incbin|fill|fillbyte|padbyte|pad|skip|base|table|cleartable)\b', re.I)
INSN = re.compile(r'^\s*([a-z]{3})(?:\.[bwl])?\b\s*([^;]*)', re.I)
IDENT = re.compile(r'(?<![\w.$#])([A-Za-z_]\w*)')
CALL = {'jsl', 'jsr', 'jml', 'jmp'}
END = {'rts', 'rtl', 'rti', 'jmp', 'jml', 'bra', 'brl', 'stp'}
SNES_JOB = ('video', 'sound', 'decompress', 'middle', 'main')


def year_key(name):
    b = os.path.splitext(os.path.basename(name))[0].lower()
    m = re.match(r'^(.+?)9[2-6](?:snes|s)?(?:_.*)?$', b)
    return m.group(1) if m else b


def genesis95_labels(d):
    """lowercase label -> 95G file key; sega/, sound/ and the RAM file left out (SNES jobs follow 94S)."""
    out = {}
    for p in sorted(glob.glob(os.path.join(d, 'src', '**', '*.asm'), recursive=True)):
        parts = os.path.relpath(p, os.path.join(d, 'src')).replace('\\', '/').split('/')
        if (len(parts) == 2 and parts[0] not in ('engine', 'front')) or len(parts) > 2 or parts[-1].lower().startswith('ram'):
            continue
        key = '/'.join(parts[:-1] + [year_key(parts[-1])])
        for line in open(p, encoding='latin-1'):
            m = re.match(r'^([A-Za-z_]\w*)\b(.*)', line)
            if m and not re.match(r'\s*:?\s*(equ|=|rs|set|macro|equr|reg)\b', m.group(2).lower()):
                out.setdefault(m.group(1).lower(), key)
    return out


def snes94_routines(d):
    base = os.path.join(d, 'src', 'routines')
    out = {}
    for p in sorted(glob.glob(os.path.join(base, '**', '*.asm'), recursive=True)):
        out.setdefault(os.path.splitext(os.path.basename(p))[0].lower(), os.path.relpath(p, base).replace('\\', '/').split('/')[0])
    return out


def source_files():
    out = []
    for l in open(os.path.join(SRC, 'nhl95snes.asm'), encoding='latin-1'):
        m = INCSRC.match(l)
        if m and not m.group(1).startswith('inc/') and not m.group(1).startswith('ram'):
            out.append(m.group(1))
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--g95', required=True, help='NHL95Genesis checkout')
    ap.add_argument('--s94', required=True, help='NHL94SNES checkout')
    ap.add_argument('--out', default=os.path.join(ROOT, 'docs', 'routines95s.csv'))
    ap.add_argument('--summary', help='also write a Markdown summary here')
    a = ap.parse_args()

    addr = {}
    symp = os.path.join(ROOT, 'output', 'nhl95snes.sym')
    if not os.path.isfile(symp):
        sys.exit('run ./build.sh first (output/nhl95snes.sym)')
    for l in open(symp):
        m = re.match(r'^([0-9a-f]{2}):([0-9a-f]{4}) (\S+)$', l.strip(), re.I)
        if m:
            addr.setdefault(m.group(3), int(m.group(1) + m.group(2), 16))
    names = {}
    for r in csv.DictReader(open(os.path.join(ROOT, 'docs', 'name_map.csv'), encoding='utf-8', newline='')):
        names.setdefault(r['name'], r.get('source') or '')

    # labels in ROM order, each with its lines, kind, whether it ends, and the calls it makes
    rows = []
    for f in source_files():
        L = open(os.path.join(SRC, f), encoding='latin-1').read().split('\n')
        cur = None
        for line in L:
            m = LBL.match(line)
            if m and not NOEMIT.match(m.group(2)):
                cur = {'label': m.group(1), 'file': f, 'kind': None, 'last': None, 'calls': [], 'refs': []}
                rows.append(cur)
                rest = m.group(2)
            elif cur is None:
                continue
            else:
                rest = line
            body = rest.split(';')[0].strip()
            if not body or body.startswith('.') and body.endswith(':') or re.match(r'^\.\w+:?$', body):
                continue
            if re.match(r'^\.\w+:?\s', body):
                body = re.sub(r'^\.\w+:?\s*', '', body)
            if cur['kind'] is None:
                cur['kind'] = 'data' if DATA.match(body) else 'code'
            for t in IDENT.findall(re.sub(r'^\s*[a-z]{2,6}(?:\.[bwl])?\s', ' ', body, flags=re.I)):
                cur['refs'].append(t)
            im = INSN.match(body)
            if im and not DATA.match(body):
                op = im.group(1).lower()
                cur['last'] = op
                if op in CALL:
                    t = re.match(r'^([A-Za-z_]\w*)', im.group(2).strip())
                    if t:
                        cur['calls'].append(t.group(1))
            elif DATA.match(body):
                cur['last'] = 'data'

    # fall-through runs: a code label not ending in END joins the next label
    head_of, heads, i = {}, [], 0
    while i < len(rows):
        h = rows[i]['label']
        heads.append(h)
        while True:
            head_of[rows[i]['label']] = h
            r = rows[i]
            if r['kind'] != 'code' or r['last'] in END or i + 1 >= len(rows) or rows[i + 1]['kind'] != 'code':
                break
            i += 1
        i += 1
    members = collections.defaultdict(list)
    for r in rows:
        members[head_of[r['label']]].append(r)
    kind = {h: members[h][0]['kind'] or 'data' for h in heads}

    callers = collections.defaultdict(set)   # runs that call it (jsl / jsr / jml / jmp)
    refs = collections.defaultdict(set)      # runs that name it anywhere else (branches, pointer tables, operands)
    for r in rows:
        for t in r['calls']:
            if t in head_of and head_of[t] != head_of[r['label']]:
                callers[head_of[t]].add(head_of[r['label']])
        for t in r['refs']:
            if t in head_of and head_of[t] != head_of[r['label']]:
                refs[head_of[t]].add(head_of[r['label']])

    g95, s94 = genesis95_labels(a.g95), snes94_routines(a.s94)
    g95keys = sorted(set(g95.values()))
    def map94(top):
        hit = [k for k in g95keys if k.split('/')[-1] == top]
        return hit[0] if hit else top

    folder, rule, ev = {}, {}, {}
    for h in heads:
        if kind[h] != 'code':
            folder[h], rule[h], ev[h] = 'data', 'data', ''
            continue
        for r in members[h]:
            k = g95.get(r['label'].lower())
            if k:
                folder[h], rule[h], ev[h] = k, '95G', f"{r['label']} in 95G {k}"
                break
        else:
            for r in members[h]:
                t = s94.get(r['label'].lower())
                if t:
                    folder[h], rule[h], ev[h] = map94(t), '94S', f"{r['label']} in 94S routines/{t}"
                    break
    # callers first (calls, then any other reference from placed code); a data run (a pointer table) takes, for voting
    # only, the folder of the code that reads it, so a routine reached through a jump table follows that code
    near = {}
    def vote(h, srcs):
        return collections.Counter(near.get(c) or folder.get(c) for c in srcs
                                   if (near.get(c) or folder.get(c)) not in (None, 'data'))
    for label, srcs in (('callers', callers), ('refs', refs)):
        changed = True
        while changed:
            changed = False
            for h in heads:
                if kind[h] != 'code':
                    if h not in near:
                        v = vote(h, refs[h])
                        if v:
                            near[h] = v.most_common(1)[0][0]
                            changed = True
                    continue
                if h in folder:
                    continue
                v = vote(h, srcs[h])
                if v:
                    (k, n), = v.most_common(1)
                    folder[h], rule[h], ev[h] = k, 'callers', f"{n} of {len(srcs[h])} {label} in {k}"
                    changed = True
    for h in heads:
        if h not in folder:
            folder[h], rule[h], ev[h] = '', 'UNSURE', f"{len(callers[h])} callers, {len(refs[h])} references, none placed"

    labels = [r['label'] for r in rows]
    with open(a.out, 'w', encoding='utf-8', newline='') as fh:
        w = csv.writer(fh, lineterminator='\n')
        w.writerow(['address', 'size', 'kind', 'head', 'label', 'callers', 'name_source', 'folder', 'rule', 'evidence'])
        for n, r in enumerate(rows):
            lab, h = r['label'], head_of[r['label']]
            ad = addr.get(lab)
            nx = next((addr[x] for x in labels[n + 1:] if x in addr), None)
            size = nx - ad if ad is not None and nx is not None and nx > ad else ''
            w.writerow(['$%06X' % ad if ad is not None else '', size, kind[h], h, lab,
                        len(callers[h]) if lab == h else '', names.get(lab, ''), folder[h],
                        rule[h] if lab == h else '', ev[h] if lab == h else ''])

    code = [h for h in heads if kind[h] == 'code']
    byf = collections.Counter(folder[h] for h in code)
    byr = collections.Counter(rule[h] for h in code)
    print(f"{len(rows)} labels, {len(heads)} runs: {len(code)} routines, {len(heads) - len(code)} data")
    print('by rule: ' + ', '.join(f'{k} {v}' for k, v in byr.most_common()))
    if a.summary:
        with open(a.summary, 'w', encoding='utf-8') as fh:
            fh.write(f"# 95S inventory summary\n\n{len(rows)} labels in {len(heads)} runs: {len(code)} routines (code), "
                     f"{len(heads) - len(code)} data runs. Full list: `docs/routines95s.csv` on the branch.\n\n")
            fh.write('## By rule\n\n| Rule | Routines |\n|---|---|\n')
            for k, v in byr.most_common():
                fh.write(f'| {k} | {v} |\n')
            fh.write('\n## By folder (`src/routines/...`)\n\n| Folder | Routines | 95G | 94S | callers |\n|---|---|---|---|---|\n')
            for k, v in sorted(byf.items(), key=lambda x: (-x[1], x[0])):
                if not k:
                    continue
                c = collections.Counter(rule[h] for h in code if folder[h] == k)
                fh.write(f"| {k} | {v} | {c['95G']} | {c['94S']} | {c['callers']} |\n")
            uns = [h for h in code if rule[h] == 'UNSURE']
            fh.write(f'\n## UNSURE ({len(uns)})\n\nNo 95G or 94S partner and no placed caller. Largest first:\n\n')
            fh.write('| Routine | Address | Labels in run | Callers | References |\n|---|---|---|---|---|\n')
            def runsize(h):
                return len(members[h])
            for h in sorted(uns, key=lambda h: -runsize(h))[:60]:
                ad = addr.get(h)
                fh.write(f"| {h} | {'$%06X' % ad if ad is not None else ''} | {runsize(h)} | {len(callers[h])} | {len(refs[h])} |\n")
            if len(uns) > 60:
                fh.write(f'\n... and {len(uns) - 60} more in the CSV (rule UNSURE).\n')


if __name__ == '__main__':
    main()

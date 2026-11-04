#!/usr/bin/env python3
"""Move the source from 4 KB segments to the aligned layout, from docs/routines95s.csv. Moves only: no byte changes.

    python3 tools/move95.py            # rewrite src/ (the build must still print MATCH)

Reads the segment list in src/nhl95snes.asm, joins the segments into one line stream in ROM order and cuts it at the
global labels. Each cut goes to the file of its unit:
  code   src/routines/<folder>/<head>.asm, the folder from the CSV (a fall-through run is one file, named by its head)
  data   src/data/<kind>/<first label>.asm: consecutive data labels of one family (Player101, Player102...; FrameTiles040,
         FrameTiles041...) share a file; a sound sample is always its own file. Kind: sound, gfx, text or tables (by name)
Then src/banks/bCx_<content>.asm lists the files of bank $Cx in ROM order, and src/nhl95snes.asm includes the banks.
The segment header comments and the segment org lines go (the segments were contiguous, so the orgs were no-ops), except
an org at a bank start, which stays where it falls. incbin paths are rewritten for the new depth.
"""
import collections, csv, os, re, sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = os.path.join(ROOT, 'src')
INCSRC = re.compile(r'^\s*incsrc\s+"([^"]+)"', re.I)
LBL = re.compile(r'^([A-Za-z_]\w*):')
ORG = re.compile(r'^\s*org\s+\$([0-9A-Fa-f]{6})\s*(;.*)?$', re.I)
SEGHDR = re.compile(r'^; Segment bank[0-9A-F]{2}_[0-9A-F]{4}\b')
INCBIN = re.compile(r'(incbin\s+")\.\./(Extracted/)', re.I)


def data_kind(n):
    if re.match(r'(Sample\w*|\w*Song\w*|\w*Sound\w*|SPC\w*|\w*Music\w*|SampleList)$', n):
        return 'sound'
    if re.search(r'(Tiles|Map|Palette|Pic|Photo|Font|Frame|Sprite|Logo|Layout|Colours|Gfx|Pieces|Picture|HDMA|Window)', n):
        return 'gfx'
    if re.match(r'(Txt|Text|Str)', n) or re.search(r'(Text|Txt|Names?|Strings?|Msg)$', n):
        return 'text'
    return 'tables'


def family(n):
    return re.sub(r'(_?[0-9A-F]{0,2}\d+|_\w+)$', '', n)


def main():
    rows = list(csv.DictReader(open(os.path.join(ROOT, 'docs', 'routines95s.csv'), encoding='utf-8', newline='')))
    head_of = {r['label']: r['head'] for r in rows}
    kind = {r['head']: r['kind'] for r in rows if r['label'] == r['head']}
    folder = {r['head']: r['folder'] for r in rows if r['label'] == r['head']}
    addr = {r['label']: int(r['address'][1:], 16) for r in rows if r['address']}

    # unit file of each run head: code by folder; data grouped by family
    unit_of, prev_fam, cur = {}, None, None
    for r in rows:
        if r['label'] != r['head']:
            continue
        h = r['head']
        if kind[h] == 'code':
            unit_of[h] = f"routines/{folder[h]}/{h}.asm"
            prev_fam = None
            continue
        f = family(h)
        if prev_fam is None or f != prev_fam or data_kind(h) == 'sound' and h.startswith('Sample'):
            cur = f"data/{data_kind(h)}/{h}.asm"
            prev_fam = f
        unit_of[h] = cur
    lower = collections.defaultdict(set)
    for p in unit_of.values():
        lower[p.lower()].add(p)
    clash = [v for v in lower.values() if len(v) > 1]
    if clash:
        sys.exit(f'file names that differ only in case: {clash[:5]}')

    root = os.path.join(SRC, 'nhl95snes.asm')
    top = open(root, encoding='latin-1').read().split('\n')
    segs = [m.group(1) for m in map(INCSRC.match, top) if m and re.match(r'bank[0-9A-F]{2}_[0-9A-F]{4}\.asm$', m.group(1))]

    # one stream; the segment header (comments up to its org) is dropped, the org kept only at a bank start
    stream = []
    for s in segs:
        L = open(os.path.join(SRC, s), encoding='latin-1').read().rstrip('\n').split('\n')
        i = 0
        while i < len(L) and (L[i].startswith(';') or not L[i].strip()) and not ORG.match(L[i]):
            i += 1
        if i < len(L) and ORG.match(L[i]):
            if int(ORG.match(L[i]).group(1), 16) & 0xFFFF == 0:
                stream.append(L[i])
            i += 1
        stream += L[i:]

    # cut at global labels; comment and blank lines just before a label go with that label
    files = collections.OrderedDict()      # path -> lines
    bank_org = {}
    order = []                             # (bank, path) in ROM order, first appearance
    head_lines, cur_path, pend = [], None, []
    for line in stream:
        m = LBL.match(line)
        if m and m.group(1) in head_of:
            p = unit_of[head_of[m.group(1)]]
            if p != cur_path:
                # an org between two units (a bank start) goes to the bank file of the unit it opens
                for x in pend:
                    if ORG.match(x) and int(ORG.match(x).group(1), 16) & 0xFFFF == 0:
                        bank_org[int(ORG.match(x).group(1), 16) >> 16] = x.strip()
                pend = [x for x in pend if not (ORG.match(x) and int(ORG.match(x).group(1), 16) & 0xFFFF == 0)]
                if p not in files:
                    files[p] = []
                    order.append((addr[m.group(1)] >> 16, p))
                elif order[-1][1] != p:
                    sys.exit(f'{p} is not contiguous (at {m.group(1)})')
                cur_path = p
            files[cur_path] += pend + [line]
            pend = []
        elif cur_path is not None and (line.startswith(';') or not line.strip() or ORG.match(line)):
            pend.append(line)
        elif cur_path is None:
            head_lines.append(line)
        else:
            files[cur_path] += pend + [line]
            pend = []
    if cur_path is not None:
        files[cur_path] += pend

    for o in head_lines:
        if ORG.match(o):
            bank_org.setdefault(int(ORG.match(o).group(1), 16) >> 16, o.strip())

    # write the unit files
    for p, L in files.items():
        depth = p.count('/') + 1
        up = '../' * depth
        out = [INCBIN.sub(lambda m: m.group(1) + up + m.group(2), x) for x in L]
        while out and not out[-1].strip():
            out.pop()
        full = os.path.join(SRC, p)
        os.makedirs(os.path.dirname(full), exist_ok=True)
        with open(full, 'w', encoding='latin-1', newline='\n') as fh:
            fh.write('\n'.join(out) + '\n')

    # bank files: named by their largest folders
    bybank = collections.OrderedDict()
    for b, p in order:
        bybank.setdefault(b, []).append(p)
    bank_files = []
    for b, ps in bybank.items():
        topics = collections.Counter()
        for p in ps:
            parts = p.split('/')
            t = parts[-2] if parts[0] == 'routines' else parts[1]
            topics[t] += os.path.getsize(os.path.join(SRC, p))
        name = '_'.join(t for t, _ in topics.most_common(2))
        bf = f'banks/b{b:02X}_{name}.asm'
        lines = [f'; Bank ${b:02X}. Files in ROM order.', '']
        if b in bank_org:
            lines += [bank_org[b], '']
        lines += [f'incsrc "../{p}"' for p in ps]
        os.makedirs(os.path.join(SRC, 'banks'), exist_ok=True)
        with open(os.path.join(SRC, bf), 'w', encoding='latin-1', newline='\n') as fh:
            fh.write('\n'.join(lines) + '\n')
        bank_files.append(bf)

    # root: segment includes -> bank includes; old segments removed
    out, done = [], False
    for l in top:
        m = INCSRC.match(l)
        if m and m.group(1) in segs:
            if not done:
                out += [f'incsrc "{bf}"' for bf in bank_files]
                done = True
            continue
        out.append(l)
    txt = '\n'.join(out)
    txt = txt.replace('one 4 KB segment after another. A segment starts as\n; an incbin of its ROM bytes and becomes source as it is disassembled; the build checks every byte against the\n; retail ROM.',
                      'one bank file per 64 KB bank (src/banks/), each\n; listing its routine (src/routines/) and data (src/data/) files in ROM order; the build checks every byte\n; against the retail ROM.')
    open(root, 'w', encoding='latin-1', newline='\n').write(txt)
    for s in segs:
        os.remove(os.path.join(SRC, s))
    print(f'{len(files)} files ({sum(p.startswith("routines/") for p in files)} routines, '
          f'{sum(p.startswith("data/") for p in files)} data) in {len(bank_files)} banks')


if __name__ == '__main__':
    main()

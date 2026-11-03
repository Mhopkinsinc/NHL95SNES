#!/usr/bin/env python3
"""Apply alignment renames: each row renames one global label everywhere in src/, its routine file when the label heads
one, and its rows in docs/name_map.csv (old name kept in old_name) and docs/routines95s.csv. Names only: no byte changes.

    python3 tools/rename95.py PROPOSALS.csv...       # columns s95_label,new_name,partner,confidence,evidence
    python3 tools/rename95.py --dry-run PROPOSALS.csv...

Only rows with confidence "sure" are applied. A row is skipped (and printed) when the old name is not a global label or
equate of the source, when the new name is already a label or equate (any case), or when two rows want the same new name.
"""
import csv, glob, os, re, sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = os.path.join(ROOT, 'src')
NAME = re.compile(r'^[A-Za-z_]\w*$')
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from check_comments import vis, split, COL  # noqa: E402  (the comment column rules)


def realign(line):
    """Put a trailing comment back at column 36 (or one tab past longer code) after a name changed length."""
    code, cm = split(line)
    if cm is None or not code.strip():
        return line
    code = code.rstrip()
    w = vis(code)
    if w >= COL:
        return code + '\t' + cm
    pad = ''
    while vis(code + pad) < COL:
        pad += '\t'
    return code + pad + cm if vis(code + pad) == COL else line


def main(argv):
    dry = '--dry-run' in argv
    paths = [a for a in argv if a != '--dry-run']
    rows = []
    for p in paths:
        for r in csv.DictReader(open(p, encoding='utf-8', newline='')):
            if (r.get('confidence') or '').strip().lower() == 'sure':
                r['_file'] = os.path.basename(p)
                rows.append(r)
    files = sorted(glob.glob(os.path.join(SRC, '**', '*.asm'), recursive=True))
    text = {f: open(f, encoding='latin-1').read() for f in files}
    glob_labels, symbols = {}, set()
    for f, t in text.items():
        for m in re.finditer(r'^([A-Za-z_]\w*)(:|\s*=)', t, re.M):
            symbols.add(m.group(1).lower())
            glob_labels.setdefault(m.group(1), f)      # a label or an equate (RAM names)
    plan, seen_new, skipped = [], set(), []
    for r in rows:
        old, new = r['s95_label'].strip(), r['new_name'].strip()
        why = None
        if not NAME.match(new):
            why = 'bad new name'
        elif old not in glob_labels:
            why = 'old label not found'
        elif old == new:
            why = 'same name'
        elif new.lower() in symbols and new.lower() != old.lower():
            why = 'new name already a symbol'
        elif new.lower() in seen_new:
            why = 'new name wanted twice'
        if why:
            skipped.append((old, new, why, r['_file']))
            continue
        seen_new.add(new.lower())
        symbols.add(new.lower())
        plan.append((old, new, r))
    for s in skipped:
        print('skip %s -> %s: %s (%s)' % s)
    print(f'{len(plan)} renames, {len(skipped)} skipped')
    if dry or not plan:
        return 0
    for old, new, r in plan:
        rx = re.compile(r'(?<![\w.$])' + re.escape(old) + r'(?!\w)')
        for f in list(text):
            if rx.search(text[f]):
                text[f] = '\n'.join(realign(rx.sub(new, x)) if rx.search(x) else x for x in text[f].split('\n'))
        for f in list(text):
            if os.path.basename(f) == old + '.asm':
                nf = os.path.join(os.path.dirname(f), new + '.asm')
                text[nf] = text.pop(f)
                os.rename(f, nf)
    for f, t in text.items():
        with open(f, 'w', encoding='latin-1', newline='') as fh:
            fh.write(t)
    ren = {old: (new, r) for old, new, r in plan}
    where = {}                             # label -> the file that defines it, for name_map.csv's file column
    for f, t in text.items():
        for m in re.finditer(r'^([A-Za-z_]\w*):', t, re.M):
            where.setdefault(m.group(1), os.path.relpath(f, ROOT).replace(os.sep, '/'))
    p = os.path.join(ROOT, 'docs', 'name_map.csv')
    nm = list(csv.DictReader(open(p, encoding='utf-8', newline='')))
    cols = list(nm[0].keys()) + ([] if 'old_name' in nm[0] else ['old_name'])
    for x in nm:
        x.setdefault('old_name', '')
        if x['name'] in ren:
            new, r = ren[x['name']]
            x['old_name'], x['name'] = x['name'], new
            x['source'] = (x.get('source') or '') + '+align'
            x['note'] = ((x.get('note') or '') + f" Renamed for alignment ({r['partner']}): {r['evidence']}").strip()
        x['file'] = where.get(x['name'], x.get('file') or '')
    with open(p, 'w', encoding='utf-8', newline='') as fh:
        w = csv.DictWriter(fh, fieldnames=cols, lineterminator='\n')
        w.writeheader()
        w.writerows(nm)
    p = os.path.join(ROOT, 'docs', 'routines95s.csv')
    inv = list(csv.DictReader(open(p, encoding='utf-8', newline='')))
    for x in inv:
        for k in ('label', 'head'):
            if x[k] in ren:
                x[k] = ren[x[k]][0]
    with open(p, 'w', encoding='utf-8', newline='') as fh:
        w = csv.DictWriter(fh, fieldnames=list(inv[0].keys()), lineterminator='\n')
        w.writeheader()
        w.writerows(inv)
    return 0


if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))

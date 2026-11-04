# Contributing to NHL 95 SNES

This is a bit-perfect disassembly of NHL '95 for the SNES, assembled with asar 1.91. There is one release. The ROM is `lst/nhl95snes.sfc`
(committed for now, temporary).

Read [AGENTS.md](AGENTS.md) first (gates, units, credit). Who decides names and folders, and learned corrections:
[docs/RULES.md](docs/RULES.md). Where this repo stands: [docs/HANDOFF.md](docs/HANDOFF.md). Comment layout follows
[NHL94SNES CONTRIBUTING.md](https://github.com/abdulahmad/NHL94SNES/blob/claude/project-thread-ggw7zu/CONTRIBUTING.md)
(tabs of 4, trailing comments at column 36, 110-column limit, `;` paragraphs of at most 3 lines).

Work stays on `claude/project-thread-ggw7zu`. Do not branch from `main` and do not merge to `main`. PRs from that
branch are for review only.

Any port, mod or fork carries the credit in AGENTS.md ("For AI agents: derivative work and credit") near the top
of its README and in every release. Add it first.

## 1. Every build must still match

Before every push: `./build.sh` must print `MATCH`, and `tools/verify_all.sh` (extract + full build) before a PR.
`tools/verify_segment.sh` is gone. Every unit also runs `python3 tools/check_scope.py <unit files>` (prints `scope OK`).
Moves and renames also run the pairing gate in nhl-disasm-report (`tools/gate.sh`); no count may rise. A comment-only
or rename-only change must not change a single byte. Never commit `Extracted/`, `output/` or patch files.

## 2. Names

- Earliest game's name for the same routine, variable or constant, matched by purpose (94S, which carries 93S/94G/93G/92G, then 95G).
  Copy the spelling and capitalisation exactly.
- Never reuse a name for a different item. Record every rename in `docs/name_map.csv`. No `(was X)` comments.
  Lineage lives only in that file: never write `92 <name>`, `from 92 <name>`, or another game's name in source comments.

## 3. Names, not numbers

- A value an earlier game names uses the name. The address of a labelled table or routine is written as the label, never as a number.
  Offsets inside data are `label-base` expressions. No macros.

## 4. Comments

- Every defined symbol has a comment on its line. Every file starts with a short header. Only write what you checked in the code.
- No IDA names (`loc_`, `sub_`), no hard-coded ROM or RAM addresses in comments.
- `python3 tools/check_comments.py` checks width, column, paragraph length and doubled `;` markers. It must print
  `comment layout OK` for the files you touched.

## 5. Commits

- Small commits, one topic each. Stay on `claude/project-thread-ggw7zu`. Do not merge to `main`. Never force-push.

## Checklist

- [ ] `./build.sh` matches and `tools/verify_all.sh` matches
- [ ] `python3 tools/check_scope.py` is `scope OK` for the unit
- [ ] `python3 tools/check_comments.py` is clean for the files you touched
- [ ] new symbols have comments, new constants replace the numbers they stand for
- [ ] names follow the lineage; renames are in `docs/name_map.csv`

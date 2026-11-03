# Rules (95S)

The rules for this repo's part of the alignment, then the learned rules. Read before every unit. Any tool adds a learned
rule in the same commit as the fix that confirmed it, newest last: `- YYYY-MM-DD <area>: <rule>. (<evidence>)`.

## Who decides what (all games)

| Category | Decided by |
|---|---|
| Name of a routine several games share | the earliest game that has it (92G is the root); a fix goes to the earliest repo first, then down the lineage |
| Name of a feature new in year N | that year's Genesis game (94G for 94S and 94PC, 95G for 95S and 95PC) |
| Name of a platform-only job | the earlier repo on that platform (94S for 95S, 94PC for 95PC), else what the code does |
| Same name, different job | the earlier meaning keeps the name |
| Top folder or file | the same-year Genesis file |
| RAM order | the merged order (92G, 93G, 94G, 93S, 94S, then 95G, 96G) |
| Data, assets, banks | the earlier repo on the same platform |
| Order inside a file | ROM order (the report re-sorts for display) |
| History | `docs/name_map.csv` only, never source comments |

## This repo

- Code base: 95S is a separate engine, not 94S code (the unpacker, transfer queues and sound driver differ). A 94S or 95G name
  needs the same job, read from both bodies; bytes rarely match.
- Folders: `src/routines/<95G group>/<95G file key>/<Routine>.asm`, one routine per file, mirroring NHL95Genesis: `engine/`
  (`collide`, `faceoff`, `fourway`, `goal`, `input`, `lines`, `logic`, `middle`, `pause`, `penalty`, `players`, `playoff`,
  `replay`, `setup`, `skate`, `video`), `front/` (`awards`, `create`, `crowd`, `injury`, `records`, `scout`, `season`,
  `shootout`, `stats`, `summary`, `title`, `trade`), and the 95G top files as folders directly under `src/routines/` (`main`,
  `hockey`, `control`, `display`, `graphics`, `schedule`, `sram`, `teamdata`, `frames`, `credits`). Decided 2026-11-03 for
  now; the owner may revisit it after comparing 94G/94S with 95G, so moves stay scripted from `docs/routines95s.csv`.
- Placement, in order: the 95G file of the routine's 95G partner; for an SNES-only engine job (NMI/IRQ, DMA and HDMA queues,
  the unpacker, SPC upload, map-set loaders) the 94S folder for that job (`video`, `sound`, `decompress`, `middle`, `main`);
  else the folder most of its callers are in; else Unsure, placed by the owner.
- Names: the pipeline names every routine, and alignment with the related repos overrides the names already in 95S, including
  earlier contributors' (owner, 2026-11-03). A routine with a 95G partner takes the 95G name; an SNES job with no 95G partner
  takes the 94S name when the job matches; else the current 95S name stays if it says what the code does; unsure keeps its
  current name and goes under Unsure. Every rename is a `docs/name_map.csv` row with the old name and the evidence.
- Data and banks follow 94S: one asset per file under `src/data/{tables,gfx,sound,text}/`, `src/banks/bCx_<content>.asm` in
  ROM order.

## Learned
- 2026-11-03 branch: all work goes onto `claude/project-thread-ggw7zu` and nothing merges to `main` yet; push there without asking once the checks pass, and stop only at the plan's review checkpoints. (owner)
- 2026-11-03 placement: a `#Label` operand (task and hook pointers) is a reference; without it 64 routines looked unreferenced. Engine services (interrupts, transfers, fades, sprites, print, work buffers, math, pads, tasks) are placed as whole families by job, not by callers, which scatter them over the screens that use them. (inventory95.py, 97 UNSURE to 0)

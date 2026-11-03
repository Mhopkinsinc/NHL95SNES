;	Segment build for bankCF_0000.asm: sets the mapping and the outside labels it uses, then includes the file
;	on its own for checking against the ROM (tools/verify_segment.sh bankCF_0000). The org is in the segment
;	file.
hirom
incsrc "../inc/snes_regs.asm"
incsrc "../ram95s.asm"

; External addresses outside, read from the ROM. Equates only (the full build has the labels).
Sequence05 = $CF1099				; sound 5, in another segment
Sequence06 = $CF1284				; sound 6, in another segment
Sequence07 = $CF1454				; sound 7, in another segment
Sequence08 = $CF1582				; sound 8, in another segment
Sequence09 = $CF1718				; sound 9, in another segment
Sequence10 = $CF19C0				; sound 10, in another segment
Sequence11 = $CF1BBF				; sound 11, in another segment
Sequence12 = $CF1D38				; sound 12, in another segment
Sequence13 = $CF1EFB				; sound 13, in another segment
Sequence14 = $CF2123				; sound 14, in another segment
Sequence15 = $CF2222				; sound 15, in another segment
Sequence16 = $CF2443				; sound 16, in another segment
Sequence17 = $CF25BA				; sound 17, in another segment
Sequence18 = $CF2744				; sound 18, in another segment
Sequence19 = $CF2844				; sound 19, in another segment
Sequence20 = $CF2A6A				; sound 20, in another segment
Sequence21 = $CF2CF5				; sound 21, in another segment
Sequence22 = $CF2F75				; sound 22, in another segment
Sequence23 = $CF319B				; sound 23, in another segment
Sequence24 = $CF33DD				; sound 24, in another segment
Sequence25 = $CF361F				; sound 25, in another segment
Sequence26 = $CF37EE				; sound 26, in another segment
Sequence27 = $CF3AB7				; sound 27, in another segment
Sequence28 = $CF3D9D				; sound 28, in another segment
Sequence29 = $CF3F79				; sound 29, in another segment
Sequence30 = $CF410C				; sound 30, in another segment
Sequence31 = $CF41BE				; sound 31, in another segment
Sequence32 = $CF4351				; sound 32, in another segment
Sequence33 = $CF4402				; sound 33, in another segment
Sequence34 = $CFC262				; sound 34, in another segment
Sequence35 = $CF5717				; sound 35, in another segment
Sequence36 = $CF46CE				; sound 36, in another segment
Sequence37 = $CF590B				; sound 37, in another segment
Sequence38 = $CF6A1A				; sound 38, in another segment
Sequence39 = $CF8145				; sound 39, in another segment
Sample00 = $C0C1CB					; sample 0, in another segment
Sample01 = $C0BE7A					; sample 1, in another segment
Sample02 = $C4F2FC					; sample 2, in another segment
Sample03 = $C38EFE					; sample 3, in another segment
Sample04 = $C3965A					; sample 4, in another segment
Sample05 = $C3AC29					; sample 5, in another segment
Sample06 = $CFD29C					; sample 6, in another segment
Sample07 = $C3B94C					; sample 7, in another segment
Sample08 = $C3C70E					; sample 8, in another segment
Sample09 = $C2DF3B					; sample 9, in another segment
Sample10 = $C2E51D					; sample 10, in another segment
Sample11 = $C2F4AA					; sample 11, in another segment
Sample12 = $C2FC60					; sample 12, in another segment
Sample13 = $C0D359					; sample 13, in another segment
Sample14 = $C0EC5E					; sample 14, in another segment
Sample15 = $C0F288					; sample 15, in another segment
Sample16 = $C0E5C5					; sample 16, in another segment
Sample17 = $C0EAA2					; sample 17, in another segment
Sample18 = $C0DE06					; sample 18, in another segment
Sample19 = $C09C54					; sample 19, in another segment
Sample20 = $C0A2AB					; sample 20, in another segment
Sample21 = $C0A965					; sample 21, in another segment
Sample22 = $C0B5BF					; sample 22, in another segment
Sample23 = $CFC561					; sample 23, in another segment
Sample24 = $C3CDBF					; sample 24, in another segment
Sample25 = $C3D52D					; sample 25, in another segment
Sample26 = $CF95A4					; sample 26, in another segment
Sample28 = $C3B574					; sample 28, in another segment
Sample29 = $C3E82F					; sample 29, in another segment
Sample30 = $C3DC1D					; sample 30, in another segment
Sample31 = $CFAAAD					; sample 31, in another segment
Sample32 = $C0D42B					; sample 32, in another segment
SoundRAMClear = $C00F05				; the sound RAM clear program (bank $C0)
SoundDriver = $C00F49				; the sound driver program (bank $C0)
RandomBelowA = $C58CCD
DefaultSongs = $C07F73
TeamSongs = $C07ECB

incsrc "../bankCF_0000.asm"

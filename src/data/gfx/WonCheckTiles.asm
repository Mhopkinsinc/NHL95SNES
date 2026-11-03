WonCheckTiles:						; 4bpp tiles, packed: a WON label in two sizes, a check mark and framed
									; boxes: Games Today's selection and played-game marks (GamesToday loads
									; them, DrawGameMarks places them)
	dw $0600						; unpacked size in bytes
	dw $0002						; format 2: literal runs and copies from up to 10 bits back
	incbin "../../../Extracted/segments/bankC0_3000.bin":$CFD..$EE2

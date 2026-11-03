GradientBarTiles:					; 4bpp tiles, packed: bars shaded from dark to light, the team-colour name
									; backplates of the setup, stats, Games Today and award screens
									; (MapTileBlock draws them 9 x 2)
	dw $0240						; unpacked size in bytes
	dw $0002						; format 2: literal runs and copies from up to 10 bits back
	incbin "../../../Extracted/segments/bankC0_0000.bin":$841..$976

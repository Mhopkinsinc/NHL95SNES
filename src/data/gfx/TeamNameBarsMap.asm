TeamNameBarsMap:					; the playoff bracket's team name bars: the 26 teams' city names in team
									; colours, 12 x 2 tiles each; PopulateBracketTeams copies them into
									; rinkmapbuf (CopyBracketTeamBar)
	dw TeamNameBarsTiles-TeamNameBarsMap-2	; the chunk's length (the bytes after this word)
	db $0C,$34						; the width and height in tiles
	db $8C							; flags: bit 7 packed (LZSS), bit 2 a map of words (bit 3 not
									; traced)
	dw $04E0						; the unpacked size
	incbin "../../../Extracted/segments/bankC1_E000.bin":$9B9..$E6B

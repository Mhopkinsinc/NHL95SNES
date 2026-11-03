; Segment bankC0_3000: a packed tile set and its palette, then the uniform palettes: for each team in team
; order a dark jersey palette and a white one. The code reads them from two bases, the away team's dark
; colours and the home team's white colours, 64 bytes per team.
org $C03CF9
WonCheckTiles:						; Games Today selection and played-game markers; GamesToday loads the
									; tiles and DrawGameMarks selects the map entries
	dw $0600						; unpacked size in bytes
	dw $0002						; format 2: literal runs and copies from up to 10 bits back
	incbin "../Extracted/segments/bankC0_3000.bin":$CFD..$EE2
WonCheckPalette:					; colours for the Games Today markers in WonCheckTiles; GamesToday sends
									; them to CGRAM palette 7
	dw $4010,$7FDE,$6ED6,$61EF,$5129,$44A5,$3421,$2800
	dw $7DFE,$44F0,$54D4,$2869,$7F5F,$001F,$1006,$03E0
AwayUniformPalettes:				; 16 colours per team, 64 bytes apart, in team order (the all-star teams
									; last, then one more pair): the dark jerseys, read with the away team
	incbin "../Extracted/segments/bankC0_3000.bin":$F02..$F22
HomeUniformPalettes:				; 16 colours per team, 64 bytes apart: the white jerseys, read with the
									; home team
	incbin "../Extracted/segments/bankC0_3000.bin":$F22..$1000
	incbin "../Extracted/segments/bankC0_4000.bin":0..$642

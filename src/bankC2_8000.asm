; Segment bankC2_8000: CenterIceTiles, a set for Decompress; its stream runs on through bankC2_9000 and ends
; in bankC2_A000.
org $C2792B
CenterIceTiles:						; the centre ice logos of the 28 teams in team order (the two all-star
									; teams last), 6 x 4 tiles each; setupice and RestoreGameScreen load the
									; home team's, which IceRinkMap shows in palette 6
	dw $5400						; the unpacked size: 672 tiles
	dw $0004						; format 4
	incbin "../Extracted/segments/bankC2_7000.bin":$92F..$1000
	incbin "../Extracted/segments/bankC2_8000.bin"

ClearTeamNameBox:					; clears 16 tiles at text map offset A and on the row below (a team name)
	clc
	adc.b $D3
	ldy.w #$0020
	pha
	phy
	jsl.l ClearRAM7E
	ply
	pla
	clc
	adc.w #$0040
	jsl.l ClearRAM7E
	rts

PlayerStatColumn:					; A = stat column $7D of roster player Y (+ tmp3 for the away team):
									; goals,
									; assists, points, shots or penalty minutes
	tya
	clc
	adc.b tmp3
	pha
	ldx.b $7D
	jmp (PlayerStatColumns,x)

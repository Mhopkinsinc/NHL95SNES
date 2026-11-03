PrintTeamNameLeft:					; prints the name of team A on row Y, thin and centred between x $20 and
									; $68 ($CF / $D1 kept)
	pei ($CF)
	pei ($D1)
	ldx.w #$0020
	stx.b $CF
	ldx.w #$0068
	stx.b $D1
	bra PrintTeamNameBody

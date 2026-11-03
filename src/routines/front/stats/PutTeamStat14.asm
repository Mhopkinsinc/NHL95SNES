PutTeamStat14:						; writes A as the next 14-bit team stat, X kept
	stx.b tmp2
	sta.b tmp1
	jsr.w WriteTeamStatBits14
	ldx.b tmp2
	rts

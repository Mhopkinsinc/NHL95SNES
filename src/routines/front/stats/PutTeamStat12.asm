PutTeamStat12:						; writes A as the next 12-bit team stat, X kept
	stx.b tmp2
	sta.b tmp1
	jsr.w WriteTeamStatBits12
	ldx.b tmp2
	rts

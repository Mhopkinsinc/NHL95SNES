PutTeamStat13:						; writes A as the next 13-bit team stat, X kept
	stx.b tmp2
	sta.b tmp1
	jsr.w WriteTeamStatBits13
	ldx.b tmp2
	rts

PutTeamStat11:						; writes A as the next 11-bit team stat (WriteTeamStatBits11), X kept
	stx.b tmp2
	sta.b tmp1
	jsr.w WriteTeamStatBits11
	ldx.b tmp2
	rts

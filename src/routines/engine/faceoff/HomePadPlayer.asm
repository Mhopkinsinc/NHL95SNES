HomePadPlayer:						; A = the player of home's first pad (c1playernum)
	lda.w #$0000
	sta.b a2
	jsl.l FirstTeamPad
	tay
	lda.w c1playernum,y
	rtl

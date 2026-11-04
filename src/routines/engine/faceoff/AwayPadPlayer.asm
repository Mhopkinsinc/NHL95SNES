AwayPadPlayer:						; A = the player of the away team's first pad (c1playernum)
	lda.w #$0002
	sta.b a2
	jsl.l FirstTeamPad
	tay
	lda.w c1playernum,y
	rtl

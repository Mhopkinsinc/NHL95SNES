resetplstuff:						; resets the players of both teams (ResetTeamPlayers for a2 = 0 and 2),
									; keeping the work words
	pei ($7F)
	pei ($81)
	pei ($83)
	pei ($85)
	pei ($87)
	pei ($89)
	pei ($63)
	pei ($65)
	pei ($67)
	pei ($69)
	pei ($6B)
	pei ($6D)
	pei ($6F)
	pei ($71)
	stz.b a2
	jsl.l ResetTeamPlayers
	lda.w #$0002
	sta.b a2
	jsl.l ResetTeamPlayers
	pla
	sta.b a3+2
	pla
	sta.b a3
	pla
	sta.b a2+2
	pla
	sta.b a2
	pla
	sta.b a1+2
	pla
	sta.b a1
	pla
	sta.b a0+2
	pla
	sta.b a0
	pla
	sta.b d2+2
	pla
	sta.b d2
	pla
	sta.b d1+2
	pla
	sta.b d1
	pla
	sta.b d0+2
	pla
	sta.b d0
	ldx.b a3
	rtl

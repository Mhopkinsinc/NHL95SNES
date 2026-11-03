SetupTeamForIntermission:			; called from other segments
	jsl.l ResetBench
	lda.w #$0001
	sta.w newperiod
	stz.b a2
	lda.w #$0002
	sta.b a3
	jsl.l SetupTeamLine
	stz.b a3
	lda.w #$0002
	sta.b a2
SetupTeamLine:						; team a3 (a2 the other): reenergizeteam, line 0, and with line changes on
									; line 3 with more players on the ice (tmap), line 5 with fewer
	jsl.l reenergizeteam
	ldx.b a3
	ldy.b a2
	stz.w tmline,x
	lda.w OptLine
	beq .rtl
	lda.w tmap,x
	sec
	sbc.w tmap,y
	sta.b d0
	beq .rtl
	lda.w #$0003
	sta.w tmline,x
	lda.b d0
	bpl .rtl
	lda.w #$0005
	sta.w tmline,x
.rtl:								; return
	rtl

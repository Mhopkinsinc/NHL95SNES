ChkGoalies:							; called from other segments
	lda.w gmclock
	bne rtss
	stz.b a2
	lda.w #$0002
	sta.b a1
	jsl.l CheckTeamGoaliePull
	stz.b a1
	lda.w #$0002
	sta.b a2
CheckTeamGoaliePull:				; check whether team a2 should pull its goalie
	ldy.b a2
	lda.w tmgoalie,y
	bmi rtss
	ldx.w tmsort,y
	ldy.w puckc
	bmi rtss
	lda.w pfteam,y
	cmp.w pfteam,x
	bne rtss
	ldy.b a2
	lda.w gmode
	bit.w #$0008
	bne .1
	lda.w teampads,y
	bne rtss
	lda.w pucky
	sta.b d1
	jsl.l CPgoalie
	rtl
.1:									; A = tmgoalie,y, A or $FF00, tmgoalie,y = A, call setpersonel
	lda.w tmgoalie,y
	ora.w #$FF00
	sta.w tmgoalie,y
	jsl.l setpersonel
rtss:								; an rtl: asstab entry 0 (no assignment), as 94S rtss
	rtl

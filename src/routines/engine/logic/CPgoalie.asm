CPgoalie:							; from CheckTeamGoaliePull, ReturnTeamGoalie and other segments
	lda.w gsp
	cmp.w #$0002
	bne .rtl
	ldy.b a1
	lda.w tmscore,y
	ldy.b a2
	sec
	sbc.w tmscore,y
	bmi .rtl
	beq .rtl
	cmp.w #$0003
	bcs .rtl
	lda.w gameclock
	cmp.w #$003D
	bcs .rtl
	lda.w tmsort,y
	tay
	lda.w pfgoal,y
	bne .1
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
.1:									; if d1 < 0 go to .rtl, Y = a2, A = tmgoalie,y, A or $FF00, ...
	lda.b d1
	bmi .rtl
	ldy.b a2
	lda.w tmgoalie,y
	ora.w #$FF00
	sta.w tmgoalie,y
	jml.l setpersonel
.rtl:								; return
	rtl

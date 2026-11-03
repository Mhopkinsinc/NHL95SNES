chk4lc:								; the computer calls a line change on the fly (puck in its own end, one
									; frame in 4, line tired by AvgCline), then CompShoot
	lda.w OptLine
	cmp.w #$0002
	beq .rtl
	lda.w pucky
	sta.b d0
	lda.w pfgoal,x
	bne .1
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
.1:									; if d0 < 0 go to .rtl, A - $005C, if the result >= 0 go to .rtl, ...
	lda.b d0
	bmi .rtl
	sec
	sbc.w #$005C
	bpl .rtl
	lda.w seed
	and.w #$0003
	bne .rtl
	phy
	ldy.w #$0000
	lda.w pfteam,x
	beq .2
	ldy.w #$0002
.2:									; A = tmflags,y, pull Y, if a $0008 bit set go to .rtl, a2 = 0, ...
	lda.w tmflags,y
	ply
	bit.w #$0008
	bne .rtl
	stz.b a2
	lda.w #$0002
	sta.b a1
	lda.w pfteam,x
	beq .3
	stz.b a1
	lda.w #$0002
	sta.b a2
.3:									; call AvgCline, if d0 >= $0C01 go to .rtl, ...
	jsl.l AvgCline
	lda.b d0
	cmp.w #$0C01
	bcs .rtl
	lda.w PenShotActive
	bne .rtl
	lda.w OptLine
	beq .rtl
	jsl.l CompLine
	jsl.l setpersonel
	jsl.l printscores1
	jml.l CompShoot
.rtl:								; return
	rtl

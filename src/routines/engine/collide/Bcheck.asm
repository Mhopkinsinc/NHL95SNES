Bcheck:								; make player a3 fall when checked from the front by player a2
	ldy.b a2
	lda.w pfalock,x
	bne .rtl
	lda.w position,x
	beq .rtl
	lda.w OptPen
	bne .1
	lda.w playerpad,y
	bmi .1
	lda.w #$0010
	clc
	adc.w checking,y
	sec
	sbc.w legstr,x
	jsl.l randoma8
	cmp.w #$000C
	bcc .rtl
.1:									; A = Xpos,x, A - Xpos,y, d0 = A, A = Ypos,x, ...
	lda.w Xpos,x
	sec
	sbc.w Xpos,y
	sta.b d0
	lda.w Ypos,x
	sec
	sbc.w Ypos,y
	sta.b d1
	jsl.l vtoa
	ldy.b a2
	lda.b d0
	sec
	sbc.w facedir,y
	inc a
	and.w #$0007
	cmp.w #$0003
	bcs .rtl
	ldx.b a2
	ldy.b a3
	sty.b a2
	stx.b a3
	jsl.l FallDown
	jsl.l PenShotChk
	beq .2
	lda.w BA_Sktr_SCnum
	bpl .2
	ldy.b a2
	sty.w BA_Sktr_SCnum
	lda.w playerpad,y
	sta.w pspad
	lda.w #$0024
	sta.b d0
	jsl.l AddPenalty
	bra .3
.rtl:								; return
	rtl
.2:									; call checkagr, if d0 >= $0005 go to .3, d0 = $0022, call AddPenalty
	jsl.l checkagr
	lda.b d0
	cmp.w #$0005
	bcs .3
	lda.w #$0022
	sta.b d0
	jsl.l AddPenalty
.3:									; X = a2, a2 = a3, a3 = X, collflag = $FFFF, ...
	ldx.b a2
	ldy.b a3
	sty.b a2
	stx.b a3
	lda.w #$FFFF
	sta.w collflag
	rtl

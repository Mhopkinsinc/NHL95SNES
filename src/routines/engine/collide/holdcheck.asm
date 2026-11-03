holdcheck:							; from CheckContactHold
	lda.w position,x
	beq .rtl
	lda.w pfalock,x
	bne .rtl
	ldy.b a2
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
	lda.w puckc
	cmp.b a3
	bne .1
	lda.w #$0008
	trb.w sflags
	bra .1
.rtl:								; return
	rtl
.1:									; facedir,y = d0, Y = a2, A = Xvel,x, A + Xvel,y, ...
	lda.b d0
	sta.w facedir,y
	ldy.b a2
	lda.w Xvel,x
	clc
	adc.w Xvel,y
	pha
	asl a
	pla
	ror a
	sta.w Xvel,x
	sta.w Xvel,y
	lda.w Yvel,x
	clc
	adc.w Yvel,y
	pha
	asl a
	pla
	ror a
	sta.w Yvel,x
	sta.w Yvel,y
	tya
	sta.w impactp,x
	lda.w #SPAflail&$FFFF
	sta.w pfalock,x
	jsl.l SetSPAFromA
	ldx.b a2
	ldy.b a3
	sty.b a2
	stx.b a3
	tya
	sta.w impactp,x
	lda.w #SPAHold2&$FFFF
	sta.w pfalock,x
	ldy.w SPA,x
	cpy.w #SPAHold&$FFFF
	beq .2
	lda.w #SPAhook2&$FFFF
.2:									; call SetSPAFromA, call PenShotChk, if zero go to .3, ...
	jsl.l SetSPAFromA
	jsl.l PenShotChk
	beq .3
	lda.w BA_Sktr_SCnum
	bpl .3
	ldy.b a2
	sty.w BA_Sktr_SCnum
	lda.w playerpad,y
	sta.w pspad
	lda.w #$0024
	sta.b d0
	jsl.l AddPenalty
	bra .5
.3:									; call checkagr, if d0 >= $0001 go to .5, d0 = $0028, ...
	jsl.l checkagr
	lda.b d0
	cmp.w #$0001
	bcs .5
	lda.w #$0028
	sta.b d0
	lda.w SPA,x
	cmp.w #SPAHold2&$FFFF
	beq .4
	lda.w #$0020
	sta.b d0
.4:									; call AddPenalty
	jsl.l AddPenalty
.5:									; X = a2, a2 = a3, a3 = X, collflag = $FFFF, ...
	ldx.b a2
	ldy.b a3
	sty.b a2
	stx.b a3
	lda.w #$FFFF
	sta.w collflag
	rtl

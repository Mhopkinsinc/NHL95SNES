checkfornewpen:						; from PenaltyManager and other segments
	lda.w sfhormode
	beq .1
	jmp.w .rtl
.1:									; a0 = PenBuf
	lda.w #PenBuf
	sta.b a0
.loop:								; loop: A = (a0), a0 + 1, a0 + 1, A and $00FF, ...
	lda.b (a0)
	inc.b a0
	inc.b a0
	and.w #$00FF
	cmp.w #$0034
	beq .loop
	tay
	bne .2
	jmp.w .rtl
.2:									; A = gmode, if a $0004 bit set go to .5, d0 = Y, ...
	lda.w gmode
	bit.w #$0004
	bne .5
	sty.b d0
	lda.w #Penaltylist>>16
	sta.b a1+2
	lda.w #Penaltylist&$FFFF
	sta.b a1
	lda.b [a1],y
	clc
	adc.b a1
	sta.b a1
	lda.b [a1]
	and.w #$00FF
	beq .4
	lda.w puckc
	bmi .8
	lsr a
	sec
	sbc.w #$0006
	sta.b d0
	dec.b a0
	lda.b (a0)
	inc.b a0
	and.w #$00FF
	bit.w #$0080
	beq .3
	ora.w #$FF00
.3:									; A - $0006, if the result < 0 go to .8
	sec
	sbc.w #$0006
	eor.b d0
	bmi .8
.4:									; call Stop4Pen
	jsl.l Stop4Pen
.5:									; a0 - 1, A = (a0), Y = A, A or $0080, ...
	dec.b a0
	lda.b (a0)
	tay
	ora.w #$0080
	sta.b (a0)
	inc.b a0
	tya
	bit.w #$0080
	beq .6
	jmp.w .loop
.6:									; a0 - 1, a0 - 1, A = (a0), a0 + 1, ...
	dec.b a0
	dec.b a0
	lda.b (a0)
	inc.b a0
	inc.b a0
	and.w #$00FF
	sta.b d0
	tay
	lda.w #Penaltylist>>16
	sta.b a1+2
	lda.w #Penaltylist&$FFFF
	sta.b a1
	lda.b [a1],y
	clc
	adc.b a1
	sta.b a1
	ldy.w #$0001
	lda.b [a1],y
	and.w #$00FF
	asl a
	asl a
	asl a
	asl a
	asl a
	sta.b d1
	sec
	sbc.w PenCntDwn
	beq .7
	bmi .7
	lda.b d1
	sta.w PenCntDwn
.7:									; go to .loop
	jmp.w .loop
.rtl:								; return
	rtl
.8:									; A = $0008, if not zero go to .7, d0 = $0030, call SetPA, ...
	lda.w #$0008
	tsb.w gmode
	bne .7
	lda.w #$0030
	sta.b d0
	jsl.l SetPA
	jmp.w .loop

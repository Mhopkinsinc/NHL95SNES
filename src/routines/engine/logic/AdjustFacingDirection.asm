AdjustFacingDirection:				; called from other segments
	lda.w facedir,x
	sta.b r3
	lda.w goalieturnwait,x
	bne .1
	lda.b d0
	sec
	sbc.b r3
	beq .1
	eor.w #$FFFF
	inc a
	and.w #$0004
	lsr a
	dec a
	sta.b d0
	clc
	adc.b r3
	and.w #$0007
	sta.w facedir,x
	lda.w #$0006
	sta.w goalieturnwait,x
	rtl
.1:									; if goalieturnwait,x = 0 go to .rtl, A - timestep, ...
	lda.w goalieturnwait,x
	beq .rtl
	sec
	sbc.w timestep
	bpl .2
	lda.w #$0000
.2:									; goalieturnwait,x = A
	sta.w goalieturnwait,x
.rtl:								; return
	rtl

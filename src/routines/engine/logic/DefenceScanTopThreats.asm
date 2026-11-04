DefenceScanTopThreats:				; scan opponents for the top-end defensive depth target
	sty.b a0
	lda.w pflags,y
	bit.w #$1000
	bne .3
	lda.w position,y
	bmi .3
	lda.w Yvel,y
	bpl .1
	lda.w #$0000
.1:									; A / 2, A / 2, A / 2, A / 2, ...
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0400
	beq .2
	ora.w #$F800
.2:									; A + Ypos,y, d1 = A, A - d0, if the result < 0 go to .3, ...
	clc
	adc.w Ypos,y
	sta.b d1
	sec
	sbc.b d0
	bmi .3
	lda.b d1
	sta.b d0
.3:									; Y = a0, Y + 1, Y + 1, d2 - 1, ...
	ldy.b a0
	iny
	iny
	dec.b d2
	bne DefenceScanTopThreats
	lda.b d0
	clc
	adc.w #$0028
	sta.b d0
	sec
	sbc.w #$00BE
	bmi .4
	lda.w #$00DC
	sta.b d0
.4:									; temp4,x = d0, A = $0000, A - temp3,x, temp3,x = A, ...
	lda.b d0
	sta.w temp4,x
	lda.w #$0000
	sec
	sbc.w temp3,x
	sta.w temp3,x
	lda.w puckx
	sta.b d0
	lda.w temp3,x
	eor.b d0
	sta.b d1
	bpl DefenceSkateAndCheck
	stz.w temp3,x
DefenceSkateAndCheck:				; skate the defender to the saved target and look for a check
	lda.w temp3,x
	sta.b d0
	lda.w temp4,x
	sta.b d1
	lda.w #rtss>>16
	sta.b a0+2
	lda.w #rtss&$FFFF
	sta.b a0
	jsl.l skateto
	jmp.w check4check

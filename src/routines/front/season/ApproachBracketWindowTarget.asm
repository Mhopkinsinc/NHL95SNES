ApproachBracketWindowTarget:		; moves the window centre at X toward tmp0 and tmp1
	sec
	lda.b tmp0
	sbc.w $0000,x
	sta.b tmp2
	bpl .1
	eor.w #$FFFF
	inc a
.1:									; if A >= $0010 go to .3, if A < $0002 go to .2, A = $0002
	cmp.w #$0010
	bcs .3
	cmp.w #$0002
	bcc .2
	lda.w #$0002
.2:									; if plus go to .4, A xor $FFFF, A + 1, go to .4
	bit.b tmp2
	bpl .4
	eor.w #$FFFF
	inc a
	bra .4
.3:									; A = tmp2, A / 2, A / 2, A / 2, ...
	lda.b tmp2
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq .4
	ora.w #$E000
.4:									; A + $0000,x, $0000,x = A, A = tmp1, A - $0002,x, ...
	clc
	adc.w $0000,x
	sta.w $0000,x
	sec
	lda.b tmp1
	sbc.w $0002,x
	sta.b tmp2
	bpl .5
	eor.w #$FFFF
	inc a
.5:									; if A >= $0010 go to .7, if A < $0002 go to .6, A = $0002
	cmp.w #$0010
	bcs .7
	cmp.w #$0002
	bcc .6
	lda.w #$0002
.6:									; if plus go to .8, A xor $FFFF, A + 1, go to .8
	bit.b tmp2
	bpl .8
	eor.w #$FFFF
	inc a
	bra .8
.7:									; A = tmp2, A / 2, A / 2, A / 2, ...
	lda.b tmp2
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq .8
	ora.w #$E000
.8:									; A + $0002,x, $0002,x = A, return
	clc
	adc.w $0002,x
	sta.w $0002,x
	rts

GetLogName:							; user A's name into mesarea: 12 letters of 5 bits from SRUserNames (+ $40
									; a letter, $1B a space, $1F the end)
	asl a
	asl a
	sta.b tmp0
	asl a
	asl a
	asl a
	asl a
	sec
	sbc.b tmp0
	tay
	ldx.w #$0000
.1:									; call NextNameBits5, if A is not $001B go to .2, A = $0020, go to .3
	jsr.w NextNameBits5
	cmp.w #$001B
	bne .2
	lda.w #$0020
	bra .3
.2:									; if A = $001F go to .rts, A + $0040
	cmp.w #$001F
	beq .rts
	adc.w #$0040
.3:									; mesarea,x = A, X + 1, if X is not $000C go to .1
	sta.w mesarea,x
	inx
	cpx.w #$000C
	bne .1
.rts:								; return
	rts

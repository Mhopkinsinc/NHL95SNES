PutNameBits5:						; writes the low 5 bits of A at bit Y of SRUserNames; Y + 5
	phx
	and.w #$001F
	sta.b tmp0
	lda.w #$001F
	sta.b tmp1
	tya
	lsr a
	lsr a
	lsr a
	tax
	tya
	and.w #$0007
.loop:								; loop: tmp1 * 2, tmp0 * 2, A - 1, if the result >= 0 go to .loop, ...
	asl.b tmp1
	asl.b tmp0
	dec a
	bpl .loop
	ror.b tmp0
	lda.b tmp1
	lsr a
	eor.w #$FFFF
	and.l SRUserNames,x
	ora.b tmp0
	sta.l SRUserNames,x
	tya
	clc
	adc.w #$0005
	tay
	plx
	rts

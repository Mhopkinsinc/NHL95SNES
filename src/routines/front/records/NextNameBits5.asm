NextNameBits5:						; A = the 5 bits at bit Y of SRUserNames; Y + 5
	phx
	tya
	lsr a
	lsr a
	lsr a
	tax
	tya
	and.w #$0007
	sta.b tmp0
	tya
	clc
	adc.w #$0005
	tay
	lda.l SRUserNames,x
.loop:								; loop: A / 2, tmp0 - 1, if the result >= 0 go to .loop, A and $001F, ...
	lsr a
	dec.b tmp0
	bpl .loop
	rol a
	and.w #$001F
	plx
	rts

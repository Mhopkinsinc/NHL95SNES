ReadCreatedPlayerSlotField:			; reads the five-bit created-player field at bit offset Y
	tya
	lsr a
	lsr a
	lsr a
	tax
	tya
	and.w #$0007
	sta.b tmp0
	lda.l SRCreatedPlayers,x
.loop:								; loop: A / 2, tmp0 - 1, if the result >= 0 go to .loop, A and $001F, ...
	lsr a
	dec.b tmp0
	bpl .loop
	rol a
	and.w #$001F
	rts

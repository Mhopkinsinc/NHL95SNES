WriteSaveBits7:						; writes the low 7 bits of tmp2 from bit Y on (WriteSaveBit seven times)
	jsr.w WriteSaveBit
	jsr.w WriteSaveBit
WriteSaveBits5:						; writes the low 5 bits of tmp2 from bit Y on (WriteSaveBit five times)
	jsr.w WriteSaveBit
WriteSaveBits4:						; writes the low 4 bits of tmp2 from bit Y on (WriteSaveBit four times)
	jsr.w WriteSaveBit
WriteSaveBits3:						; writes the low 3 bits of tmp2 from bit Y on (WriteSaveBit three times)
	jsr.w WriteSaveBit
	jsr.w WriteSaveBit
WriteSaveBit:						; writes bit 0 of tmp2 to bit Y of the save RAM bit array at
									; SRCreatedPlayers (masks ByteBitMasks); tmp2 / 2, Y + 1
	lsr.b tmp2
	bcs .1
	tya
	and.w #$0007
	tax
	lda.l ByteBitMasks,x
	and.w #$00FF
	eor.w #$FFFF
	sta.b tmp0
	tya
	lsr a
	lsr a
	lsr a
	tax
	lda.l SRCreatedPlayers,x
	and.b tmp0
	sta.l SRCreatedPlayers,x
	iny
	rts
.1:									; A = Y, A and $0007, X = A, A = ByteBitMasks,x, ...
	tya
	and.w #$0007
	tax
	lda.l ByteBitMasks,x
	and.w #$00FF
	sta.b tmp0
	tya
	lsr a
	lsr a
	lsr a
	tax
	lda.l SRCreatedPlayers,x
	ora.b tmp0
	sta.l SRCreatedPlayers,x
	iny
	rts

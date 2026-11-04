ReadTextThreeBits:					; read a three-bit packed text extension
	jsr.w PeekTextBits
	and.w #$0007
	pha
	lda.w #$0003
	bra AdvanceTextBits

ReadTextFiveBits:					; read a five-bit packed text symbol
	jsr.w PeekTextBits
	and.w #$001F
	pha
	lda.w #$0005
AdvanceTextBits:					; advance the packed text bit cursor and return the saved symbol
	clc
	adc.b $0A
	cmp.w #$0008
	bcc .1
	inc.b $16
	sbc.w #$0008
.1:									; $0A = A, pull A, A 8-bit, return
	sta.b $0A
	pla
	sep #$20
	rts

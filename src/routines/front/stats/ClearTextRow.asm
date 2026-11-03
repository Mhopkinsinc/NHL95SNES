ClearTextRow:						; clears row $6D of the text map at $D3 (32 tiles)
	lda.b a2+2
	xba
	lsr a
	lsr a
	adc.b $D3
	tax
	ldy.w #$0020
	lda.w #$0000
.loop:								; loop: $0000,x = A, X + 1, X + 1, Y - 1, ...
	sta.w $0000,x
	inx
	inx
	dey
	bne .loop
	rts

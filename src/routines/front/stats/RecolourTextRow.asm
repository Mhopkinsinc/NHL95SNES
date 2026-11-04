RecolourTextRow:					; puts palette bits d0 on the non-blank tiles of text row A (32 tiles;
									; their palette bits cleared first)
	xba
	lsr a
	lsr a
	adc.b $D3
	tax
	ldy.w #$0020
.loop:								; loop: A = $0000,x, if the result = 0 go to .1, A or d0, $0000,x = A
	lda.w $0000,x
	and.w #$E3FF
	beq .1
	ora.b d0
	sta.w $0000,x
.1:									; X + 1, X + 1, Y - 1, if the result is not 0 go to .loop, ...
	inx
	inx
	dey
	bne .loop
	rts

SetLineSlotLD:						; slot 0 (LD, line byte +1) = player $7B; the old LD goes to RD when the
									; player was there
	lda.w $0002,x
	cmp.b $7B
	bne .1
	lda.w $0001,x
	sta.w $0002,x
.1:									; $0001,x = $7B, A 16-bit, return
	lda.b $7B
	sta.w $0001,x
	rep #$20
	rts

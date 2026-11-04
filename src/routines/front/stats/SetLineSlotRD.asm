SetLineSlotRD:						; slot 1 (RD, line byte +2) = player $7B; the old RD goes to LD when the
									; player was there
	lda.w $0001,x
	cmp.b $7B
	bne .1
	lda.w $0002,x
	sta.w $0001,x
.1:									; $0002,x = $7B, A 16-bit, return
	lda.b $7B
	sta.w $0002,x
	rep #$20
	rts

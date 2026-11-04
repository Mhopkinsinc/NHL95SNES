SetLineSlotC:						; slot 3 (C, line byte +4) = player $7B; the old C goes to LW or RW,
									; wherever the player was
	lda.w $0003,x
	cmp.b $7B
	bne .2
	lda.w $0004,x
	sta.w $0003,x
.1:									; $0004,x = $7B, A 16-bit, return
	lda.b $7B
	sta.w $0004,x
	rep #$20
	rts
.2:									; if $0005,x is not $7B go to .1, $0005,x = $0004,x, go to .1
	lda.w $0005,x
	cmp.b $7B
	bne .1
	lda.w $0004,x
	sta.w $0005,x
	bra .1

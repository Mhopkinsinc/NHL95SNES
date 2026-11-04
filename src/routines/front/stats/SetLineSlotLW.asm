SetLineSlotLW:						; slot 2 (LW, line byte +3) = player $7B; the old LW goes to RW or C,
									; wherever the player was
	lda.w $0005,x
	cmp.b $7B
	bne .2
	lda.w $0003,x
	sta.w $0005,x
.1:									; $0003,x = $7B, A 16-bit, return
	lda.b $7B
	sta.w $0003,x
	rep #$20
	rts
.2:									; if $0004,x is not $7B go to .1, $0004,x = $0003,x, go to .1
	lda.w $0004,x
	cmp.b $7B
	bne .1
	lda.w $0003,x
	sta.w $0004,x
	bra .1

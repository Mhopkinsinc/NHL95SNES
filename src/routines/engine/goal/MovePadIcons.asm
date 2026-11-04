MovePadIcons:						; SetContTeams each frame: MovePadIcon for each of the 5 pads whose
									; buttons changed, the buttons ORed into $7D (start / select there end the
									; setup)
	stz.b $7D
	lda.w PadRaw1
	cmp.w padlast1
	beq .1
	ldx.b a4
	jsr.w MovePadIcon
.1:									; if PadRaw2 = padlast1+2 go to .2, X = $75, call MovePadIcon
	lda.w PadRaw2
	cmp.w padlast1+2
	beq .2
	ldx.b $75
	jsr.w MovePadIcon
.2:									; if PadRaw3 = padlast1+4 go to .3, X = $77, call MovePadIcon
	lda.w PadRaw3
	cmp.w padlast1+4
	beq .3
	ldx.b $77
	jsr.w MovePadIcon
.3:									; if PadRaw4 = padlast1+6 go to .4, X = $79, call MovePadIcon
	lda.w PadRaw4
	cmp.w padlast1+6
	beq .4
	ldx.b $79
	jsr.w MovePadIcon
.4:									; if PadRaw5 = padlast1+8 go to .rts, X = $7B, go to MovePadIcon
	lda.w PadRaw5
	cmp.w padlast1+8
	beq .rts
	ldx.b $7B
	bra MovePadIcon
.rts:								; return
	rts

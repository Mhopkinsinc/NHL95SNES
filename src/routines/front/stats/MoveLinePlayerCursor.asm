MoveLinePlayerCursor:				; list row A (the old cursor) back to palette 0 and cursor row $7B in
									; palette 1 (RecolourTextRow, rows wrapped as RedrawScrollList does), the
									; map sent; a delay when padlast is set
	ldx.b a3+2
	inx
	stx.b tmp1
	inx
	stx.b tmp2
	ldx.w #$2000
	stx.b d0
.loop:								; loop: if A < tmp1 go to .1, A - tmp2, if the result >= 0 go to .loop
	cmp.b tmp1
	bcc .1
	sbc.b tmp2
	bpl .loop
.1:									; A + a4, call RecolourTextRow, d0 = $2400, A = $7B
	clc
	adc.b a4
	jsr.w RecolourTextRow
	lda.w #$2400
	sta.b d0
	lda.b $7B
.loop2:								; loop: if A < tmp1 go to .2, A - tmp2, if the result >= 0 go to .loop2
	cmp.b tmp1
	bcc .2
	sbc.b tmp2
	bpl .loop2
.2:									; A + a4, call RecolourTextRow, call SendTextMap, call WaitTransfers, ...
	clc
	adc.b a4
	jsr.w RecolourTextRow
	jsl.l SendTextMap
	jsl.l WaitTransfers
	ldx.w #$0000
	lda.w padlast
	beq .rts
.loop3:								; loop: X - 1, if the result is not 0 go to .loop3, ...
	dex
	bne .loop3
	stz.w repeatdelayframes
	stz.w padchangeany
.rts:								; return
	rts

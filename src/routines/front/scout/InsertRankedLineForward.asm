InsertRankedLineForward:			; inserts a forward and his overall rating into the descending line
									; selection lists
	ldy.w #$0000
.loop:								; loop: if ScratchBuf+$C0,y < 0 go to .2, ...
	lda.w ScratchBuf+$C0,y
	bmi .2
	cmp.w ScratchBuf,x
	bcc .1
	iny
	iny
	bra .loop
.1:									; push Y, push X, tmp2 = Y, A = $001D, ...
	phy
	phx
	sty.b tmp2
	sec
	lda.w #$001D
	sbc.b tmp2
	pha
	ldx.w #ScratchBuf+$DC
	ldy.w #ScratchBuf+$DE
	mvp $7E,$7E
	pla
	ldx.w #ScratchBuf+$9C
	ldy.w #ScratchBuf+$9E
	mvp $7E,$7E
	plx
	ply
.2:									; ScratchBuf+$C0,y = ScratchBuf,x, A = ScratchBuf+$40,x, A + 1, ...
	lda.w ScratchBuf,x
	sta.w ScratchBuf+$C0,y
	lda.w ScratchBuf+$40,x
	inc a
	sta.w ScratchBuf+$80,y
	rts

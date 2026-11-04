FindPlayoffDivisionSeed:			; finds the highest remaining seed matching the division mask
	ldy.w #$000C
.loop:								; loop: X = ScratchBuf,y, A = $000C,x, X = A, A = TeamDivisionCodes,x, ...
	ldx.w ScratchBuf,y
	lda.w $000C,x
	tax
	lda.l TeamDivisionCodes,x
	bit.b tmp0
	bne .rts
	dey
	dey
	bpl .loop
	iny
	iny
.rts:								; return
	rts

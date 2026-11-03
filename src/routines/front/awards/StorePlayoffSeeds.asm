StorePlayoffSeeds:					; writes the eight ranked team numbers to the playoff seed list
	sep #$20
	ldy.w #$000E
.loop:								; loop: X = ScratchBuf,y, [r0] = $000C,x, X = r0, X + 1, ...
	ldx.w ScratchBuf,y
	lda.w $000C,x
	sta.b [r0]
	ldx.b r0
	inx
	stx.b r0
	dey
	dey
	bpl .loop
	rep #$20
	rts

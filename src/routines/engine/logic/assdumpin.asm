assdumpin:							; called from other segments
	cpx.w puckc
	bne .2
	lda.w pflags,x
	bit.w #$0002
	beq .3
	jsl.l DumpInTarget
	lda.w pflags,x
	and.w #$FFFD
	sta.w pflags,x
	lda.w playerpad,x
	bpl .3
	lda.w dumpintarget
	cmp.w #$0014
	beq .1
	cmp.w #$0008
	beq .1
	rtl
.1:									; go to CompShoot
	jmp.w CompShoot
.2:									; go to assexit
	jmp.w assexit
.3:									; Y = $0000, if passdir = facedir,x go to .4, Y + 1, A - 1, ...
	ldy.w #$0000
	lda.w passdir
	cmp.w facedir,x
	beq .4
	iny
	dec a
	and.w #$0007
	cmp.w facedir,x
	beq .4
	iny
	inc a
	inc a
	and.w #$0007
	cmp.w facedir,x
	beq .4
	lda.w passdir
	sta.b d0
	jsl.l AdjustFacingDirection
	rtl
.4:									; if position,x is not 0 go to .5, A = Y, A * 2, A + dumpintarget, ...
	lda.w position,x
	bne .5
	tya
	asl a
	adc.w dumpintarget
	sta.w dumpintarget
	lda.w facedir,x
	sta.w passdir
.5:									; call LaunchDumpIn, go to assexit
	jsl.l LaunchDumpIn
	jmp.w assexit

FindPositionSlot:					; Y = the slot (from Y, six of them) of the player in position A, or
									; $FFFF; the flags from cpy #0
	pha
	lda.w #$0006
	sta.b d0
	pla
.loop:								; loop: if A = position,y go to .1, Y + 1, Y + 1, d0 - 1, ...
	cmp.w position,y
	beq .1
	iny
	iny
	dec.b d0
	bne .loop
	ldy.w #$FFFF
.1:									; return
	cpy.w #$0000
	rts

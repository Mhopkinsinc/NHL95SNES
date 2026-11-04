ShowConnectedPads:					; SetContTeams each frame: shows the icons of the 5 pads whose mp5padsig
									; is 1 and hides the others (bit 0 of $22)
	ldy.w #$0004
.loop:								; loop: push Y, A = mp5padsig,y, A and $00FF, A - 1, ...
	phy
	lda.w mp5padsig,y
	and.w #$00FF
	dec a
	tax
	tya
	asl a
	tay
	cpx.w #$0001
	ldx.b $73,y
	lda.b $22,x
	ora.w #$0001
	bcc .1
	and.w #$FFFE
.1:									; $22,x = A, pull Y, Y - 1, if the result >= 0 go to .loop, ...
	sta.b $22,x
	ply
	dey
	bpl .loop
	rts

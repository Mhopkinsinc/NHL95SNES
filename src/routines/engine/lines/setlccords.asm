setlccords:							; team a2's line change box: A = its map address (the side by team and the
									; gmode direction bit), X = the width $B, Y = the height 5, or 4 when
									; getlchoice 2 has no line
	lda.w gmode
	ldx.b a2
	beq .2
	bit.w #$0002
	beq .3
.1:									; Y = $5AB5, if tmap = tmap+2 go to .4, Y = $5AD5, go to .4
	ldy.w #$5AB5
	lda.w tmap
	cmp.w tmap+2
	beq .4
	ldy.w #$5AD5
	bra .4
.2:									; if $0002 bits clear go to .1
	bit.w #$0002
	beq .1
.3:									; Y = $5855, if LCBoxesClosed = 0 go to .4, Y = $5995
	ldy.w #$5855
	lda.w LCBoxesClosed
	beq .4
	ldy.w #$5995
.4:									; push Y, A = $0002, call getlchoice, Y = $0005, ...
	phy
	lda.w #$0002
	jsr.w getlchoice
	ldy.w #$0005
	cmp.w #$FFFF
	bne .5
	dey
.5:									; X = $000B, pull A, return
	ldx.w #$000B
	pla
	rts

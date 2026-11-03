PuckCarrierPad:						; called from other segments
	ldy.b d0
	lda.w playerpad,y
	bpl .rtl
	phx
	ldx.w #$0000
	cpy.w #$000C
	bcc .1
	ldx.w #$0002
.1:									; if teampads,x = 0 go to .4, Y = puckpadnext,x, Y - 1, Y - 1, ...
	lda.w teampads,x
	beq .4
	ldy.w puckpadnext,x
	dey
	dey
	bpl .2
	ldy.w #$0008
.2:									; r3 = $0005, A = X
	lda.w #$0005
	sta.b r3
	txa
.3:									; if A is not padside,y go to .5, d4 = Y, A = Y, puckpadnext,x = A, ...
	cmp.w padside,y
	bne .5
	sty.b d4
	tya
	sta.w puckpadnext,x
	jsl.l AssignPadPlayer
.4:									; pull X, return
	plx
	rtl
.5:									; Y - 1, Y - 1, if the result >= 0 go to .6, Y = $0008
	dey
	dey
	bpl .6
	ldy.w #$0008
.6:									; r3 - 1, if the result is not 0 go to .3, pull X
	dec.b r3
	bne .3
	plx
.rtl:								; return
	rtl

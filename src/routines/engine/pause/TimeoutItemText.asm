TimeoutItemText:					; the Options tab's Time Out item, left out (pauseitems - 1, pauseitem
									; kept below it) when the pad's team has no time out left (tmtimeouts)
	phy
	phx
	jsl.l seta2
	lda.w #$5A08
	ldx.b a2
	ldy.w tmtimeouts,x
	bne .2
	dec.w pauseitems
	ldy.w pauseitem
	cpy.w pauseitems
	bcc .1
	dec.w pauseitem
.1:									; A = $0000
	lda.w #$0000
.2:									; pull X, pull Y, go to PrintPauseItemText
	plx
	ply
	jmp.w PrintPauseItemText

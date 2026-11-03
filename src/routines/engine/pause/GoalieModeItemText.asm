GoalieModeItemText:					; the Options tab's goalie mode item: the manual goalie text when
									; goaliemode1 of the pad's team (seta2) is set, else the auto goalie
									; text
	phy
	phx
	jsl.l seta2
	lda.w #$59FC
	ldx.b a2
	ldy.w goaliemode1,x
	beq .1
	lda.w #$59EF
.1:									; pull X, pull Y, go to PrintPauseItemText
	plx
	ply
	jmp.w PrintPauseItemText

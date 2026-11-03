OtherScoresItemText:				; the Info tab's Other Scores item, left out (pauseitems - 1, pauseitem
									; kept below it) unless OptPlayMode is 2
	phx
	lda.w #$5991
	ldx.w OptPlayMode
	cpx.w #$0002
	beq .2
	dec.w pauseitems
	ldy.w pauseitem
	cpy.w pauseitems
	bcc .1
	dec.w pauseitem
.1:									; A = $0000
	lda.w #$0000
.2:									; pull X, go to PrintPauseItemText
	plx
	jmp.w PrintPauseItemText

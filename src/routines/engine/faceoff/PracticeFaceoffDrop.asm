PracticeFaceoffDrop:				; practice mode's drop (OptPlayMode 1): the puck still at the face off
									; spot (fox / foy), then each team's first free pad takes its goalie
	jsr.w CentrePuck
	lda.w fox
	sta.w puckx
	lda.w foy
	sta.w pucky
	stz.b d4
	jsr.w PracticePadGoalie
	lda.w #$0002
	sta.b d4
	jsr.w PracticePadGoalie
	rtl

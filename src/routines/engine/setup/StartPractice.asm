StartPractice:						; play mode Practice (PlayModeStarts): line changes and penalties off, the
									; pad limits from the Home Players / Visitor Players options + 1, then
									; SetContTeams
	stz.w OptLine
	stz.w OptPen
	lda.w homepracplayers
	inc a
	sta.b d0
	lda.w awaypracplayers
	inc a
	sta.b d0+2
	bra SetContTeams

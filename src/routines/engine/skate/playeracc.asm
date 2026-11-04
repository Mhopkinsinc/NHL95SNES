playeracc:							; player X accelerates toward direction d2 (0 up, clockwise): the routine
									; of that direction from PlayerAccOneFrame (d7 = 1) or PlayerAccFrames
	lda.b d2
	asl a
	tax
	lda.b d7
	dec a
	beq .1
	jmp (PlayerAccFrames,x)
.1:									; jump through PlayerAccOneFrame,x
	jmp (PlayerAccOneFrame,x)

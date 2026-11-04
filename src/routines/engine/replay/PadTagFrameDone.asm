PadTagFrameDone:					; the frame layout's continuation for the player tags: the OAM pointer
									; kept, then NextPadTag
	sty.b $2A
	ldy.b $10
	bra NextPadTag

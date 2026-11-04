AssignPadIfFree:					; gives the free pad d4 to player d0 (AssignPadPlayer) unless he already
									; has one
	ldy.b d0
	lda.w playerpad,y
	bpl .rtl
	jsl.l AssignPadPlayer
.rtl:								; return
	rtl

HomeFaceoffLineChange:				; home's face off line change: with automatic line changes (OptLine 2) the
									; computer picks home's line, else player d0 opens the box
									; (StartFaceoffLineChange)
	lda.w OptLine
	cmp.w #$0002
	bne StartFaceoffLineChange
	stz.b a2
	lda.w #$0002
	sta.b a1
	lda.w #$0001
	sta.b d0
	bra SetFaceoffPersonnel

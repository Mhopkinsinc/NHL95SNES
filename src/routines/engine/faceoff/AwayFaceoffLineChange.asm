AwayFaceoffLineChange:				; the away team's face off line change, as HomeFaceoffLineChange
	lda.w OptLine
	cmp.w #$0002
	bne StartFaceoffLineChange
	stz.b a1
	lda.w #$0002
	sta.b a2
	sta.b d0
	bra SetFaceoffPersonnel

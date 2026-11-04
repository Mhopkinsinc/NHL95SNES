FieldPos:							; prints the created player's position (d0: Goalie, Left Defense, Right
									; Defense, Left Wing, Center, Right Wing; CreatedPosNames) on row 8, its
									; field cleared first
	lda.w #$0008
	jsr.w ClearFieldValue
	lda.b d0
	asl a
	tax
	lda.l CreatedPosNames,x
	tax
	ldy.w #$0008
	jsl.l PrintItalicLeft
	rts

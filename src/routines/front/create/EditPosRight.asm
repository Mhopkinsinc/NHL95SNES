EditPosRight:						; position line, right: d0 one on (0 after 5), then FieldPos
	lda.b d0
	inc a
	cmp.w #$0006
	bcc StorePosField
	lda.w #$0000
	bra StorePosField

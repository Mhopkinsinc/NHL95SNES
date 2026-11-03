EditPosLeft:						; position line, left: d0 one back (5 after 0), then FieldPos
	lda.b d0
	dec a
	bpl StorePosField
	lda.w #$0005
StorePosField:						; d0 = the position (0-5), then FieldPos
	sta.b d0
	jmp.w FieldPos
	rts								; unreached: no code branches, falls or points here

EditWeightLeft:						; weight line, left: $81 one back (15 after 0), then FieldWeight
	lda.b d0+2
	dec a
	bpl StoreWeightField
	lda.w #$000F
StoreWeightField:					; $81 = the weight step (0-15), then FieldWeight
	sta.b d0+2
	jmp.w FieldWeight

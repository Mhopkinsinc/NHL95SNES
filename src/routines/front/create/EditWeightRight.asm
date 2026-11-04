EditWeightRight:					; weight line, right: $81 one on (0 after 15), then FieldWeight
	lda.b d0+2
	inc a
	cmp.w #$0010
	bcc StoreWeightField
	lda.w #$0000
	bra StoreWeightField

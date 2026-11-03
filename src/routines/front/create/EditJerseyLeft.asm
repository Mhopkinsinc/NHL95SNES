EditJerseyLeft:						; number line, left: d1 one back (99 after 0), then FieldJersey
	lda.b d1
	dec a
	bpl StoreJerseyField
	lda.w #$0063
StoreJerseyField:					; d1 = the sweater number (0-99), then FieldJersey
	sta.b d1
	jmp.w FieldJersey

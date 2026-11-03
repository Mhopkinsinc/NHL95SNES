EditJerseyRight:					; number line, right: d1 one on (0 after 99), then FieldJersey
	lda.b d1
	inc a
	cmp.w #$0064
	bcc StoreJerseyField
	lda.w #$0000
	bra StoreJerseyField

UnpackText2:						; as UnpackText, into the second work buffer (AllocWorkBuf2)
	phy
	stx.b $16
	lda.w #$003C
	jsl.l AllocWorkBuf2
	bra DecodePackedText

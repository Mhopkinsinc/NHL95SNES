GlideBack:							; starts SPAglideback on player X (SetSPAFromA) unless pfalock is set
	lda.w pfalock,x
	bne .rtl
	lda.w #SPAglideback&$FFFF
	jsl.l SetSPAFromA
.rtl:								; return
	rtl

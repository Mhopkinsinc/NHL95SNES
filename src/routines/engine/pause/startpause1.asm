startpause1:						; pause from pad 1: sfpj = 0, then startpause
	stz.w sfpj
startpause:							; starts a pause: the sflags pause bit, unless sfhormode is set
	lda.w sfhormode
	bne .rtl
	lda.w #$0001
	tsb.w sflags
.rtl:								; return
	rtl

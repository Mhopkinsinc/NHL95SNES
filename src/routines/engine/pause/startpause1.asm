startpause1:						; pause from pad 1: pausepad = 0, then startpause
	stz.w pausepad
startpause:							; starts a pause: the sflags pause bit, unless sfhormode is set
	lda.w sfhormode
	bne .rtl
	lda.w #$0001
	tsb.w sflags
.rtl:								; return
	rtl

showref:							; clear the referee window changed flag
	lda.w #$0200
	trb.w sflags
	rtl

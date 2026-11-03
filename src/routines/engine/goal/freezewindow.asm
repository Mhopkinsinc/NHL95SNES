freezewindow:						; called from other segments
	lda.b Vpos
	sta.w yc1
	lda.b Hpos
	sta.w xc1
	lda.w #$0040
	tsb.w sflags
	rtl

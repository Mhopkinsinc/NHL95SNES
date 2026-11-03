FadeOut:							; starts a fade out: fadestep = $FFFF
	lda.w #$FFFF
	sta.w fadestep
	rtl

FadeOut:							; starts a fade out: fadein = $FFFF
	lda.w #$FFFF
	sta.w fadein
	rtl

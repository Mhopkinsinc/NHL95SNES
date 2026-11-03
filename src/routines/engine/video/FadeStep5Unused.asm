FadeStep5Unused:					; fadein = 5, then rtl; nothing calls it
	lda.w #$0005
	sta.w fadein
	rtl

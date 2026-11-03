FadeStep5Unused:					; fadestep = 5, then rtl; nothing calls it
	lda.w #$0005
	sta.w fadestep
	rtl

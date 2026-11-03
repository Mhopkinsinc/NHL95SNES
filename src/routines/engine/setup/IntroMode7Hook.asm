IntroMode7Hook:						; writes the intro Mode 7 scale, centre, control and main-screen shadows
	sep #$20
	lda.w introM7Scale
	sta.w M7A
	lda.w introM7Scale+1
	sta.w M7A
	lda.w introM7Scale
	sta.w M7D
	lda.w introM7Scale+1
	sta.w M7D
	lda.w introM7X
	sta.w M7X
	lda.w introM7X+1
	sta.w M7X
	lda.w introM7Y
	sta.w M7Y
	lda.w introM7Y+1
	sta.w M7Y
	lda.w introM7SEL
	sta.w M7SEL
	lda.w introTM
	sta.w TM
	rep #$20
	rtl

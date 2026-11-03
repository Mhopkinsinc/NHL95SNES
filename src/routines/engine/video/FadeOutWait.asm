FadeOutWait:						; fadein = $FFFF, then wait until the screen is black (94S FadeOut, ...
	lda.w #$FFFF
	sta.w fadein
.loop:								; loop: if brightness-1 >= 0 go to .loop, return
	lda.w brightness-1
	bpl .loop
	rtl

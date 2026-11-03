BlankScreen:						; wait a frame, the default hooks, IRQ off, fade out, HDMA off
	jsl.l WaitFrame
	jsl.l IRQOff
	jsl.l ClearFrameHook
	jsl.l ClearNMIHook
	lda.w #$FFFF
	sta.w fadein
	stz.w DMAEnShadow
.loop:								; until the fade is out
	lda.w brightness-1
	bpl .loop
	rtl

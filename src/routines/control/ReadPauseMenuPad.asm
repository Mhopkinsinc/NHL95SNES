ReadPauseMenuPad:					; read the pause pad into the menu word and update the repeat timer
	jsl.l ReadPausePad
	lda.b d3
	sta.w padchangeany
	inc.w repeatdelayframes
	cmp.w padlast
	beq .rtl
	stz.w repeatdelayframes
	sta.w padlast
.rtl:								; return
	rtl

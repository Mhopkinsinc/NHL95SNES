SetIRQ:								; turn on an IRQ at line Y with the routine at X:A
	php
	sei
	sep #$20
	pha
	lda.b #$81
	sta.l NMITIMEN
	pla
	rep #$20
	tya
	sty.w IRQVTime
	sta.l VTIMEL
	lda.w IRQHTime
	sta.l HTIMEL
	sep #$10
	stx.w IRQHook+2
	sta.w IRQHook
	jsl.l WaitFrame
	sep #$20
	lda.b #$B1
	sta.l NMITIMEN
	plp
	cli
IRQHook_Off:						; rtl; the IRQ hook when the raster IRQ is off
	rtl

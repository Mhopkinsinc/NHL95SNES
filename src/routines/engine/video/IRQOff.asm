IRQOff:								; turn the IRQ off, the NMI and pad reading on
	sei
	php
	pha
	sep #$20
	lda.b #$81
	sta.l NMITIMEN
	stz.w IRQHook+2
	rep #$20
	lda.w #IRQHook_Off
	sta.w IRQHook
	pla
	plp
	cli
	rtl

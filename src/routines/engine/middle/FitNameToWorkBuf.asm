FitNameToWorkBuf:					; FitName into a new work buffer entry of A + 2 bytes (long calls)
	pha
	adc.w #$0002
	jsl.l AllocWorkBuf
	tay
	pla
	jsr.w FitName
	rtl

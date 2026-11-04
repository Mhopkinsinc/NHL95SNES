AllocWorkBuf:						; takes A bytes from the work buffer in bank $7E: returns A = their start
									; (the buffer pointer moves on)
	pei ($08)
	clc
	adc.b $08
	sta.b $08
	pla
	rtl

FreeWorkBuf:						; gives the last A bytes back to the work buffer (AllocWorkBuf)
	sec
	sbc.b $08
	eor.w #$FFFF
	inc a
	sta.b $08
	rtl

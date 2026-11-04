AllocWorkBuf2:						; as AllocWorkBuf, from the second work buffer (from $E000)
	pei ($D7)
	clc
	adc.b $D7
	sta.b $D7
	pla
	rtl

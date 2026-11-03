SkipThreeBits:						; 3 bits on in the packed text (an escape's extra bits)
	pha
	tya
	clc
	adc.w #$0003
	bra AdvanceSkipBits

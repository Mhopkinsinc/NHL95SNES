SkipNextSymbol:						; A = the next 5-bit symbol at X (bit Y), then 5 bits on
	jsr.w PeekSkipBits
	and.w #$001F
	pha
	tya
	clc
	adc.w #$0005
AdvanceSkipBits:					; Y = A, past 8 bits X + 1 and Y - 8
	cmp.w #$0008
	bcc .1
	inx
	sbc.w #$0008
.1:									; Y = A, pull A, return
	tay
	pla
	rts

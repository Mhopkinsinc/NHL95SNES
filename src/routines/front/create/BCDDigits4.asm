BCDDigits4:							; mesarea = the 4 BCD digits of A as text, leading zeros kept
	tax
	xba
	and.w #$00F0
	lsr a
	lsr a
	lsr a
	lsr a
	adc.w #$0030
	sta.w mesarea
	txa
	xba
	and.w #$000F
	adc.w #$0030
	sta.w mesarea+1
	txa
	and.w #$00F0
	lsr a
	lsr a
	lsr a
	lsr a
	adc.w #$0030
	sta.w mesarea+2
	txa
	and.w #$000F
	adc.w #$0030
	sta.w mesarea+3
	rts

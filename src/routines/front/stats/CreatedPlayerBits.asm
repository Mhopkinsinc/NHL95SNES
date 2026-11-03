CreatedPlayerBits:					; Y = A = the bit offset of created player A's record ($9C bits each, from
									; player $26A)
	sec
	sbc.w #$026A
	tay
	pha
	asl a
	adc.b $01,s
	sta.b $01,s
	tya
	asl a
	asl a
	adc.b $01,s
	asl a
	asl a
	sta.b $01,s
	tya
	xba
	lsr a
	adc.b $01,s
	ply
	tay
	rts

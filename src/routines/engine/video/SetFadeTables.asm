SetFadeTables:						; lays out the colour fade's six tables of A words from Y: red, green,
									; blue, then their steps (a0, $65, a1, $69, a2, $6D)
	asl a
	sta.b $77
	tya
	sta.b a0
	adc.b $77
	sta.b a0+2
	adc.b $77
	sta.b a1
	adc.b $77
	sta.b a1+2
	adc.b $77
	sta.b a2
	adc.b $77
	sta.b a2+2
	rts

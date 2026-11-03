ScaleSkatingSpeed11:				; multiply the bounded skating speed factor in A by 11
	sta.b r2+2
	asl a
	sta.b r2
	asl a
	asl a
	adc.b r2
	adc.b r2+2
	rts

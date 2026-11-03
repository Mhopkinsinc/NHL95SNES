ScaleSkatingSpeed12:				; multiply the bounded skating speed factor in A by 12
	asl a
	asl a
	sta.b r2
	asl a
	adc.b r2
	rts

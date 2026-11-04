ScaleSkatingSpeed10:				; multiply the bounded skating speed factor in A by 10
	asl a
	sta.b r2
	asl a
	asl a
	adc.b r2
	rts

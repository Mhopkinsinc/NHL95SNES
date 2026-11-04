ScaleSkatingSpeed3:					; multiply the bounded skating speed factor in A by 3
	sta.b r2
	asl a
	adc.b r2
	rts

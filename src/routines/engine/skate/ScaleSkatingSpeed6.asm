ScaleSkatingSpeed6:					; multiply the bounded skating speed factor in A by 6
	asl a
	sta.b r2
	asl a
	adc.b r2
	rts

ScaleSkatingSpeed5:					; multiply the bounded skating speed factor in A by 5
	sta.b r2
	asl a
	asl a
	adc.b r2
	rts

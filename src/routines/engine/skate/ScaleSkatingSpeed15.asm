ScaleSkatingSpeed15:				; multiply the bounded skating speed factor in A by 15
	sta.b r2
	asl a
	asl a
	asl a
	asl a
	sec
	sbc.b r2
	rts

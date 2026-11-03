Sweepcheck:							; start a sweep check by player X
	lda.w #SPAsweepchk&$FFFF
	sta.w pf2aip,x
	jml.l SetSPAFromA

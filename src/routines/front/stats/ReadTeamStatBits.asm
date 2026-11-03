ReadTeamStatBits:					; A = the next A bits of the team stats bit stream at SRTeamStats (bit
									; pointer r2, advanced)
	sta.b r1
	lda.b r2
	lsr a
	lsr a
	lsr a
	tax
	lda.l SRTeamStats,x
	sta.b r0
	lda.l SRTeamStats+2,x
	sta.b r0+2
	lda.b r2
	and.w #$0007
	asl a
	tax
	lda.b r1
	adc.b r2
	sta.b r2
	lda.b r0+2
	jmp (StatBitsShiftTable,x)

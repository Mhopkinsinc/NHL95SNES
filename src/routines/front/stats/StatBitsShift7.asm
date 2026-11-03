StatBitsShift7:						; shifts the stream bits right 7 times (A into r0), then on down to
									; StatBitsMask
	lsr a
	ror.b r0
StatBitsShift6:						; the stream bits right 6 times, then on to StatBitsMask
	lsr a
	ror.b r0
StatBitsShift5:						; the stream bits right 5 times, then on to StatBitsMask
	lsr a
	ror.b r0
StatBitsShift4:						; the stream bits right 4 times, then on to StatBitsMask
	lsr a
	ror.b r0
StatBitsShift3:						; the stream bits right 3 times, then on to StatBitsMask
	lsr a
	ror.b r0
StatBitsShift2:						; the stream bits right 2 times, then on to StatBitsMask
	lsr a
	ror.b r0
StatBitsShift1:						; the stream bits right once, then on to StatBitsMask
	lsr a
	ror.b r0
StatBitsMask:						; A = r0's low r1 bits (LowBitMasks), ReadTeamStatBits' result
	lda.b r1
	asl a
	tax
	lda.b r0
	and.l LowBitMasks-2,x
	rts

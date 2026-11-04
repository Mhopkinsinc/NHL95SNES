StatBitsShiftTable:					; ReadTeamStatBits' entries by the stream's bit offset (0-7):
									; StatBitsMask, then StatBitsShift1-7
	dw StatBitsMask,StatBitsShift1,StatBitsShift2,StatBitsShift3
	dw StatBitsShift4,StatBitsShift5,StatBitsShift6,StatBitsShift7

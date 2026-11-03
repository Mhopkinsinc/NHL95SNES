RatingColumns:						; per skater column (A * 4): d4 attribute mask, then RosterColumnTable
									; offset; mask bit n reads byte n/2, high nibble for even n, low for odd n
									; bit 0 requests overall; weight is bit 2, hand bit 9
	dw $0000,$0000,$5DF9,$000A,$0000,$0002,$0008,$000A
	dw $0010,$000A,$0200,$0004,$0020,$000A,$0040,$000A
	dw $0080,$000A,$0800,$000A,$4000,$000A,$0400,$000A
	dw $0004,$0006,$1000,$000A,$8000,$000A,$0100,$000A

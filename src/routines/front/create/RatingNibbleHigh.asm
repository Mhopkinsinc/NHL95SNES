RatingNibbleHigh:					; RatingNibble * 16 (for the high nibble of a record byte)
	jsr.w RatingNibble
	asl a
	asl a
	asl a
	asl a
	rts

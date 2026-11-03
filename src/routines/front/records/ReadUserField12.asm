ReadUserField12:					; A = the 12-bit field of the user record at X ($65 half-bytes in)
	stx.b a2
	lda.b a0+2
	lsr a
	tay
	lda.b [a2],y
	bcc .1
	lsr a
	lsr a
	lsr a
	lsr a
.1:									; A and $0FFF, return
	and.w #$0FFF
	rts

PutPauseScore:						; the three big digits PushNumberWidth left (width 3) to pause map tile Y
									; on, two tiles apart (PutClockDigit)
	lda.w PushWidthBuf+2
	jsr.w PutClockDigit
	iny
	iny
	lda.w PushWidthBuf+3
	jsr.w PutClockDigit
	iny
	iny
	lda.w PushWidthBuf+4
PutClockDigit:						; copies big digit A (its low 4 bits: 2 x 3 tiles from the digit set in
									; the pause map) to pause map tile Y
	phy
	and.w #$000F
	asl a
	asl a
	adc.w PauseMapBuf
	tax
	tya
	asl a
	adc.w PauseMapBuf
	tay
	lda.w $0700,x
	sta.w $0000,y
	lda.w $0702,x
	sta.w $0002,y
	lda.w $0740,x
	sta.w $0040,y
	lda.w $0742,x
	sta.w $0042,y
	lda.w $0780,x
	sta.w $0080,y
	lda.w $0782,x
	sta.w $0082,y
	ply
	rts

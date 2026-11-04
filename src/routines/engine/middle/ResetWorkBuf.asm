ResetWorkBuf:						; both work buffer pointers back to their starts, the saved mark too
	lda.w #unpackbuf&$FFFF
	sta.w WorkBufMark
RestoreWorkBuf:						; the work buffer pointer back to the saved mark (MarkWorkBuf), the second
									; one to its start
	lda.w WorkBufMark
	sta.b $08
	lda.w #$E000
	sta.b $D7
	rtl

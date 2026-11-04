MarkWorkBuf:						; saves the work buffer pointer as the mark RestoreWorkBuf goes back to
	lda.b $08
	sta.w WorkBufMark
	rtl

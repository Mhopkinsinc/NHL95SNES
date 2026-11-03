TagSecondDigit:						; a tag continuation: the second roster number digit, 8 pixels right
	clc
	lda.b $0A
	adc.w #$0008
	sta.b $0A
	lda.b tmp2
	sta.b tmp1
	lda.w #TagPositionMark
	sta.b tmp3
	jmp.w PutTagChar

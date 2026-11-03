TeamSavePctText:					; mesarea = team record Y's save percentage (+$14)
	lda.w $0014,y
	jsr.w BinToBCD
	jmp.w BCDText

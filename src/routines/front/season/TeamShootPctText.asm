TeamShootPctText:					; mesarea = team record Y's shooting percentage (+$16)
	lda.w $0016,y
	jsr.w BinToBCD
	jmp.w BCDText

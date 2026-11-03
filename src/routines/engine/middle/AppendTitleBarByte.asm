AppendTitleBarByte:					; append one byte to the title bar string
	sta.l $7E0000,x
	inx
	rts

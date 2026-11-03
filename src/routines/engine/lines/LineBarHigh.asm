LineBarHigh:						; fills two energy bar tiles and selects the third tile remainder
	lda.w #$8888
	sta.w $0000,y
	lda.w #$0080
	sta.b d1
	lda.b d1+2
	sec
	sbc.w #$2000
	iny
	iny
	bra LineBarQueue

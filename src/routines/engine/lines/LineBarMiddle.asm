LineBarMiddle:						; fills the first energy bar tile and selects the second tile remainder
	lda.w #$0091
	sta.w $0000,y
	lda.w #$0089
	sta.b d1
	lda.b d1+2
	sec
	sbc.w #$1000
	iny
	bra LineBarQueue

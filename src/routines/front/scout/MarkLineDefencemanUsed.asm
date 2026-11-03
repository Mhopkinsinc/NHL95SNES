MarkLineDefencemanUsed:				; appends the defenceman index to the used list and increments its count
	ldy.b r0+2
	sta.w ScratchBuf+$200,y
	iny
	sty.b r0+2
	rts

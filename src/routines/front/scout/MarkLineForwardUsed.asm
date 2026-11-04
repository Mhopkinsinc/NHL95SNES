MarkLineForwardUsed:				; appends the forward index to the used list and increments its count
	ldy.b r0
	sta.w ScratchBuf+$1C0,y
	iny
	sty.b r0
	rts

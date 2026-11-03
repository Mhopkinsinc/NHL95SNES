GetNewPresses:						; the changed buttons (padchange) and the new presses (padnew1)
									; five pads, from their last state
	lda.b PadRaw1
	eor.w padlast1
	sta.w padchange
	and.b PadRaw1
	sta.w padnew1
	lda.b PadRaw2
	eor.w padlast1+2
	sta.w padchange+2
	and.b PadRaw2
	sta.w padnew1+2
	lda.b PadRaw3
	eor.w padlast1+4
	sta.w padchange+4
	and.b PadRaw3
	sta.w padnew1+4
	lda.b PadRaw4
	eor.w padlast1+6
	sta.w padchange+6
	and.b PadRaw4
	sta.w padnew1+6
	lda.b PadRaw5
	eor.w padlast1+8
	sta.w padchange+8
	and.b PadRaw5
	sta.w padnew1+8
	lda.b PadRaw1
	sta.w padlast1
	lda.b PadRaw2
	sta.w padlast1+2
	lda.b PadRaw3
	sta.w padlast1+4
	lda.b PadRaw4
	sta.w padlast1+6
	lda.b PadRaw5
	sta.w padlast1+8
	rts

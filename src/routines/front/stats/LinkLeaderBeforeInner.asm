LinkLeaderBeforeInner:				; links entry Y before a non-head entry X, updating both neighbouring
									; links
	lda.w $0002,x
	sta.w $0002,y
	sta.b tmp2
	txa
	sta.w $0000,y
	tya
	sta.w $0002,x
	ldx.b tmp2
	sta.w $0000,x
	rts

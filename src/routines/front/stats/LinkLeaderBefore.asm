LinkLeaderBefore:					; links leader entry Y before entry X; at the head (X = d0) Y becomes the
									; head
	cpx.b d0
	bne LinkLeaderBeforeInner
	sty.b d0
	txa
	sta.w $0000,y
	tya
	sta.w $0002,x
	tyx
	stz.w $0002,x
	rts

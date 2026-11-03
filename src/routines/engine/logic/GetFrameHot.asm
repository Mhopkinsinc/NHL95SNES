GetFrameHot:						; return the current frame hot spot in d0 and d1
	phx
	tay
	lda.w frame,y
	asl a
	tax
	lda.l FrameHotY,x
	eor.w #$FFFF
	inc a
	sta.b d1
	lda.w attribute,y
	bit.w #$0800
	beq .1
	lda.l FrameHotX,x
	eor.w #$FFFF
	inc a
	sta.b d0
	plx
	rtl
.1:									; d0 = FrameHotX,x, pull X, return
	lda.l FrameHotX,x
	sta.b d0
	plx
	rtl

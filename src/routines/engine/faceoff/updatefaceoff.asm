updatefaceoff:						; the face off countdown (temp1): the ref's drop frame from the time left
									; (fofdata)
	lda.w temp1,x
	beq .3
	clc
	adc.w #$0006
	lsr a
	lsr a
	lsr a
	sta.b d0
	cmp.w #$0003
	bpl .rtl
	lda.w penshot
	bne .2
	lda.w OptPlayMode
	cmp.w #$0001
	beq .2
	phx
	phy
	lda.w FaceoffBoxTimer
	inc a
	sta.w FaceoffBoxTimer
	lsr a
	lsr a
	cmp.w #$0004
	bcc .1
	lda.w #$0003
.1:									; call QueueFaceoffBox, pull Y, pull X
	jsl.l QueueFaceoffBox
	ply
	plx
.2:									; A = d0, A xor $FFFF, A + 1, A + $000A, ...
	lda.b d0
	eor.w #$FFFF
	inc a
	clc
	adc.w #$000A
	sta.b d0
	sta.w fofdata
.rtl:								; return
	rtl
.3:									; push X, call ClearTextMapTop, push Y, push A, ...
	phx
	jsl.l ClearTextMapTop
	phy
	pha
	lda.w penshot
	bne .4
	lda.w OptPlayMode
	cmp.w #$0001
	beq .4
	ldx.w FaceoffSpriteLeft
	jsl.l DeleteSprite
	ldx.w FaceoffSpriteRight
	jsl.l DeleteSprite
	lda.w FaceoffBoxBuf
	sta.w WorkBufMark
.4:									; pull A, pull Y, pull X, FrameCount = 0, ...
	pla
	ply
	plx
	stz.w FrameCount
	stz.b gameframes
	rtl

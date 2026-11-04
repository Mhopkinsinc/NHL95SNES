SetLCmode2:							; draws the line change box of team a2: the frame, then a row per line
									; choice (getlchoice) with its button letter (LineChangeButtons)
	phx
	jsr.w setlccords
	sta.b d0
	sty.b d0+2
	jsl.l Framer
	lda.b a2
	jsr.w TeamSecondText
	jsl.l UnpackText2
	jsr.w StringToBoxTiles
	lda.b d0
	clc
	adc.w #$0027
	tay
	txa
	ldx.w #$007E
	jsl.l QueueVRAMDMALen
	lda.b d0+2
	dec a
	asl a
	asl a
	asl a
	asl a
	asl a
	sec
	adc.b d0
	sta.b d0
	lda.w #$0002
.loop:								; loop: d0+2 = A, call getlchoice, X = A, if the result < 0 go to .3, ...
	sta.b d0+2
	jsr.w getlchoice
	tax
	bmi .3
	ldy.b a2
	lda.w tmflags,y
	bit.w #$0008
	bne .1
	lda.b d0+2
	cmp.w tmlcchoice,y
	bne .2
	ldx.w tmline,y
.1:									; push X, A = $0006, call AllocWorkBuf2, Y = A, ...
	phx
	lda.w #$0006
	jsl.l AllocWorkBuf2
	tay
	lda.w #$0005
	sta.w $0000,y
	lda.b d0+2
	asl a
	tax
	lda.l LineChangeButtons,x
	sta.w $0001,y
	lda.b $01,s
	asl a
	adc.b $01,s
	tax
	lda.l linelist,x
	sta.w $0003,y
	lda.l linelist+1,x
	sta.w $0004,y
	tya
	ldx.w #$007E
	ldy.b d0
	jsl.l QueueVRAMDMALen
	pla
	jsr.w linebar
.2:									; A = d0, A - $0020, d0 = A
	lda.b d0
	sec
	sbc.w #$0020
	sta.b d0
.3:									; A = d0+2, A - 1, if the result >= 0 go to .loop, pull X, ...
	lda.b d0+2
	dec a
	bpl .loop
	plx
	rtl

EditUserName:						; edits the chosen user name on the letter grid (DrawNameGrid): pad to a
									; letter, B to select, Y to go back, start when done, X cancels
	jsr.w DrawNameGrid
.loop:								; loop: TransfersReady + 1, call ReadPauseMenuPad, $26 + 1, ...
	inc.w TransfersReady
	wai
	jsl.l ReadPauseMenuPad
	inc.b $26
	jsl.l AnimateSprites
	lda.w #OAMBuf+$1FF
	sta.b $28
	lda.w #OAMHighBytes
	sta.b $2A
	jsl.l BuildSpriteOAM
	jsl.l PackOAMHigh
	lda.w repeatdelayframes
	bne .loop
	lda.w padchangeany
	bit.w #$0200
	beq .1
	jsr.w GridCellPalette3
	dec.b a1
	bpl .5
	lda.w #$001A
	bra .4
.1:									; if $0100 bits clear go to .2, call GridCellPalette3, A = a1, A + 1, ...
	bit.w #$0100
	beq .2
	jsr.w GridCellPalette3
	lda.b a1
	inc a
	cmp.w #$001B
	bcc .4
	stz.b a1
	bra .5
.2:									; if $0800 bits clear go to .3, call GridCellPalette3, A = a1, ...
	bit.w #$0800
	beq .3
	jsr.w GridCellPalette3
	lda.b a1
	sec
	sbc.w #$0009
	bpl .4
	adc.w #$001B
	bra .4
.3:									; if $0400 bits clear go to .6, call GridCellPalette3, A = a1, ...
	bit.w #$0400
	beq .6
	jsr.w GridCellPalette3
	lda.b a1
	clc
	adc.w #$0009
	cmp.w #$001B
	bcc .4
	sbc.w #$001B
.4:									; a1 = A
	sta.b a1
.5:									; call MoveGridCursor, go to .11
	jsr.w MoveGridCursor
	bra .11
.6:									; if $8080 bits clear go to .8, X = a1, A = LetterGridChars,x, ...
	bit.w #$8080
	beq .8
	ldx.b a1
	lda.l LetterGridChars,x
	ldy.b a1+2
	sep #$20
	cmp.b #$3D
	bne .7
	lda.b #$20
.7:									; mesarea,y = A, A 16-bit, Y + 1, if Y >= $000C go to .10, ...
	sta.w mesarea,y
	rep #$20
	iny
	cpy.w #$000C
	bcs .10
	sty.b a1+2
	bra .10
.8:									; if $4000 bits clear go to .12, if a1+2 = 0 go to .9, X - 1
	bit.w #$4000
	beq .12
	ldx.b a1+2
	beq .9
	dex
.9:									; mesarea,x = $3E3E, a1+2 = X
	lda.w #$3E3E
	sta.w mesarea,x
	stx.b a1+2
.10:								; call PrintEditedName, call SendTextMap
	jsr.w PrintEditedName
	jsl.l SendTextMap
.11:								; go to .loop
	jmp.w .loop
.12:								; if $0040 bits clear go to .13, A = a0+2, call GetLogName, go to .14
	bit.w #$0040
	beq .13
	lda.b a0+2
	jsr.w GetLogName
	bra .14
.13:								; if $1000 bits clear go to .11, A = a0+2, call PutUserName
	bit.w #$1000
	beq .11
	lda.b a0+2
	jsr.w PutUserName
.14:								; X = $FFFF, A 8-bit
	ldx.w #$FFFF
	sep #$20
.loop2:								; loop: X + 1, if mesarea,x is not $3E go to .loop2, mesarea,x = 0, ...
	inx
	lda.w mesarea,x
	cmp.b #$3E
	bne .loop2
	stz.w mesarea,x
	rep #$20
	lda.b a0+2
	xba
	lsr a
	lsr a
	adc.b $D3
	adc.w #$0188
	ldy.w #$0020
	jsl.l ClearRAM7E
	lda.w mesarea
	and.w #$00FF
	beq .15
	lda.b a0+2
	clc
	adc.w #$0006
	tay
	lda.w #$0020
	sta.b $CF
	ldx.w #mesarea
	jsl.l PrintBoldLeftStr
.15:								; A = $D3, A + $0380, Y = $0380, call ClearRAM7E, ...
	lda.b $D3
	clc
	adc.w #$0380
	ldy.w #$0380
	jsl.l ClearRAM7E
	lda.w #$0010
	sta.b $CF
	ldx.w #TxtBEditName&$FFFF
	ldy.w #$0019
	jsl.l PrintBoldLeft
	ldx.w #TxtStartSelectPlayer&$FFFF
	ldy.w #$001A
	jsl.l PrintBoldLeft
	jsl.l SendTextMap
	ldx.b a0
	lda.w #$0003
	jsl.l SetSpriteAnim
	lda.w #$0010
	sta.b $05,x
	lda.b a0+2
	asl a
	asl a
	asl a
	adc.w #$0036
	sta.b $08,x
	lda.w padchangeany
	bit.w #$0040
	bne .rts
	lda.b a0+2
	jsr.w ClearUserRecord
.rts:								; return
	rts

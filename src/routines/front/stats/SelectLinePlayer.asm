SelectLinePlayer:					; picks a player for the line slot: a scrolling list of the team's
									; players, up / down scroll, left / right change the rating column ($7D),
									; B picks, start leaves
	pei ($7B)
	pei ($65)
	pei ($79)
	pei ($69)
	lda.b $D3
	clc
	adc.w #$0300
	ldy.w #$0400
	jsl.l ClearRAM7E
	jsl.l SendTextMap
	jsl.l WaitTransfers
	stz.b $7D
	stz.b $7B
	stz.b d4+2
	lda.w #$0001
	sta.w RatingMode
	ldx.b a0
	lda.b a1+2
	cmp.w #$0002
	bcs .1
	lda.w $0002,x
	clc
	adc.w $0004,x
	sta.b a0+2
	lda.w $0006,x
	sta.b a1
	bra .2
.1:									; a0+2 = $0002,x, a1 = $0004,x
	lda.w $0002,x
	sta.b a0+2
	lda.w $0004,x
	sta.b a1
.2:									; A = DrawLinePlayerRow, X = $000A, Y = $000E, call StartScrollList, ...
	lda.w #DrawLinePlayerRow
	ldx.w #$000A
	ldy.w #$000E
	jsr.w StartScrollList
	jsr.w PrintLinePlayerHeader
	jsl.l SendTextMap
.loop:								; loop: TransfersReady + 1
	inc.w TransfersReady
.loop2:								; loop: if TransfersReady is not 0 go to .loop2, call ReadMenuPads, ...
	lda.w TransfersReady
	bne .loop2
	jsl.l ReadMenuPads
	inc.b $26
	jsr.w ScrollListArrows
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
	bit.w #$1000
	bne .12
	bit.w #$0800
	beq .4
	lda.b $7B
	pha
	beq .3
	dec a
	sta.b $7B
.3:									; call ScrollListUp, pull A, go to .6
	jsr.w ScrollListUp
	pla
	bra .6
.4:									; if $0400 bits clear go to .7, A = $7B, push A, A + 1, ...
	bit.w #$0400
	beq .7
	lda.b $7B
	pha
	inc a
	cmp.b a1
	bcs .5
	sta.b $7B
.5:									; call ScrollListDown, pull A
	jsr.w ScrollListDown
	pla
.6:									; call MoveLinePlayerCursor, go to .loop
	jsr.w MoveLinePlayerCursor
	bra .loop
.7:									; if $0200 bits clear go to .8, if $7D = 0 go to .loop, A - 1, ...
	bit.w #$0200
	beq .8
	lda.b $7D
	beq .loop
	dec a
	sta.b $7D
	bra .9
.8:									; if $0100 bits clear go to .10, if $7D >= $000F go to .loop, A + 1, ...
	bit.w #$0100
	beq .10
	lda.b $7D
	cmp.w #$000F
	bcs .loop
	inc a
	sta.b $7D
.9:									; call ClearLinePlayerStatColumn, call PrintLinePlayerHeader, ...
	jsr.w ClearLinePlayerStatColumn
	jsr.w PrintLinePlayerHeader
	jsr.w RedrawScrollList
	jsl.l SendTextMap
.10:								; if $8000 bits clear go to .11, A = a0+2, A + $7B, $7B = A, ...
	bit.w #$8000
	beq .11
	lda.b a0+2
	clc
	adc.b $7B
	sta.b $7B
	lda.b $05,s
	sta.b a0+2
	lda.b $03,s
	tax
	lda.b $01,s
	jsr.w SetLineSlot
	bra .12
.11:								; go to .loop
	jmp.w .loop
.12:								; X = $77, call DeleteSprite, X = $79, call DeleteSprite, ...
	ldx.b $77
	jsl.l DeleteSprite
	ldx.b $79
	jsl.l DeleteSprite
	jsr.w RefreshSprites
	pla
	sta.b a1+2
	pla
	sta.b $79
	pla
	sta.b a0+2
	pla
	sta.b $7B
	jsl.l WaitTransfers
	lda.b $D3
	clc
	adc.w #$0300
	ldy.w #$0400
	jsl.l ClearRAM7E
	jsl.l SendTextMap
	jsl.l WaitTransfers
	lda.w #$8000
	sta.w DMAEnShadow
	sep #$20
	lda.b #$1F
	sta.l TM
	lda.b #$FF
	sta.l $002112
	sta.l $002112
	rep #$20
	rts

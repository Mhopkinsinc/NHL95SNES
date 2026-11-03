TagPadMarker:						; a tag continuation: the pad's marker 20 pixels up, its tile
									; (PadMarkerTiles) and its mirror, 16 x 16 each
	sec
	lda.b $0C
	sbc.w #$0014
	sta.b $0C
	sec
	lda.b $0A
	sbc.w #$0004
	ldx.b $0E
	bne .1
	sbc.w #$0004
.1:									; $0A = A, if $10 is not $000C go to .2, go to TagReplayMarker
	sta.b $0A
	ldx.b $10
	cpx.w #$000C
	bne .2
	jmp.w TagReplayMarker
.2:									; tmp2 = PadMarkerTiles,x, Y = $2A, X = $0002, A = $FFF0, ...
	lda.l PadMarkerTiles,x
	sta.b tmp2
	ldy.b $2A
	pei ($A3)
	ldx.w #$0002
	clc
	lda.w #$FFF0
	adc.b $0A
	bpl .3
	cmp.w #$FFF1
	bcc .4
	inx
	and.w #$00FF
.3:									; if A >= $0100 go to .4, tmp0 = A, if $0C >= 0 go to .5, ...
	cmp.w #$0100
	bcs .4
	sta.b tmp0
	lda.b $0C
	bpl .5
	cmp.w #$FFF1
	and.w #$00FF
	bcs .6
.4:									; pull A, go to .7
	pla
	bra .7
.5:									; if A >= $00E0 go to .4
	cmp.w #$00E0
	bcs .4
.6:									; A or tmp0, push A, $00,y = X, Y + 1
	xba
	ora.b tmp0
	pha
	stx.b $00,y
	iny
.7:									; A = tmp2, A + $4000, push A, X = $0002, ...
	clc
	lda.b tmp2
	adc.w #$4000
	pha
	ldx.w #$0002
	lda.b $0A
	bpl .8
	cmp.w #$FFF1
	bcc .9
	inx
	and.w #$00FF
.8:									; if A >= $0100 go to .9, tmp0 = A, if $0C >= 0 go to .10, ...
	cmp.w #$0100
	bcs .9
	sta.b tmp0
	lda.b $0C
	bpl .10
	cmp.w #$FFF1
	and.w #$00FF
	bcs .11
.9:									; pull A, go to .12
	pla
	bra .12
.10:								; if A >= $00E0 go to .9
	cmp.w #$00E0
	bcs .9
.11:								; A or tmp0, push A, $00,y = X, Y + 1
	xba
	ora.b tmp0
	pha
	stx.b $00,y
	iny
.12:								; $2A = Y, Y = $10
	sty.b $2A
	ldy.b $10
NextPadTag:							; the next pad's tag; after pad 0, the stack and QueueBusy restored
	dey
	dey
	bmi .1
	jmp.w DrawPadTag
.1:									; $28 = A, A = $1C, QueueBusy = 0, return
	tsc
	sta.b $28
	lda.b $1C
	tcs
	stz.b QueueBusy
	rtl

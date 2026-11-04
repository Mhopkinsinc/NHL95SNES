PrepareIntroMode7Sprite:			; converts the sprite pixels and builds its Mode 7 tile map and
									; positioning
	lda.b $34,x
	and.w #$FF00
	lsr a
	lsr a
	lsr a
	lsr a
	adc.w #$0080
	sta.b $79
	jsl.l RestoreWorkBuf
	phx
	stz.b a4
	lda.b $28,x
	asl a
	adc.b $26,x
	tax
	lda.b $00,x
	tax
	lda.b $01,x
	and.w #$00FF
	asl a
	asl a
	sta.b $77
	ldx.b $08
.1:									; A 8-bit, $75 = $08
	sep #$20
	lda.b #$08
	sta.b $75
.loop:								; loop: A = $0000,y, A and $80, call MergeIntroPixelRotate2, ...
	lda.w $0000,y
	and.b #$80
	jsr.w MergeIntroPixelRotate2
	lda.w $0001,y
	and.b #$80
	jsr.w MergeIntroPixelRotate3
	lda.w $0010,y
	and.b #$80
	jsr.w MergeIntroPixelRotate4
	lda.w $0011,y
	and.b #$80
	jsr.w MergeIntroPixelShift4
	jsr.w StoreIntroPixel
	lda.w $0000,y
	and.b #$40
	jsr.w MergeIntroPixelRotate3
	lda.w $0001,y
	and.b #$40
	jsr.w MergeIntroPixelRotate4
	lda.w $0010,y
	and.b #$40
	jsr.w MergeIntroPixelShift4
	lda.w $0011,y
	and.b #$40
	jsr.w MergeIntroPixelShift3
	jsr.w StoreIntroPixel
	lda.w $0000,y
	and.b #$20
	jsr.w MergeIntroPixelRotate4
	lda.w $0001,y
	and.b #$20
	jsr.w MergeIntroPixelShift4
	lda.w $0010,y
	and.b #$20
	jsr.w MergeIntroPixelShift3
	lda.w $0011,y
	and.b #$20
	jsr.w MergeIntroPixelShift2
	jsr.w StoreIntroPixel
	lda.w $0000,y
	and.b #$10
	jsr.w MergeIntroPixelShift4
	lda.w $0001,y
	and.b #$10
	jsr.w MergeIntroPixelShift3
	lda.w $0010,y
	and.b #$10
	jsr.w MergeIntroPixelShift2
	lda.w $0011,y
	and.b #$10
	jsr.w MergeIntroPixelShift1
	jsr.w StoreIntroPixel
	lda.w $0000,y
	and.b #$08
	jsr.w MergeIntroPixelShift3
	lda.w $0001,y
	and.b #$08
	jsr.w MergeIntroPixelShift2
	lda.w $0010,y
	and.b #$08
	jsr.w MergeIntroPixelShift1
	lda.w $0011,y
	and.b #$08
	tsb.b a4
	jsr.w StoreIntroPixel
	lda.w $0000,y
	and.b #$04
	jsr.w MergeIntroPixelShift2
	lda.w $0001,y
	and.b #$04
	jsr.w MergeIntroPixelShift1
	lda.w $0010,y
	and.b #$04
	tsb.b a4
	lda.w $0011,y
	and.b #$04
	jsr.w MergeIntroPixelRotate1
	jsr.w StoreIntroPixel
	lda.w $0000,y
	and.b #$02
	jsr.w MergeIntroPixelShift1
	lda.w $0001,y
	and.b #$02
	tsb.b a4
	lda.w $0010,y
	and.b #$02
	jsr.w MergeIntroPixelRotate1
	lda.w $0011,y
	and.b #$02
	jsr.w MergeIntroPixelRotate2
	jsr.w StoreIntroPixel
	lda.w $0000,y
	and.b #$01
	tsb.b a4
	lda.w $0001,y
	and.b #$01
	jsr.w MergeIntroPixelRotate1
	lda.w $0010,y
	and.b #$01
	jsr.w MergeIntroPixelRotate2
	lda.w $0011,y
	and.b #$01
	jsr.w MergeIntroPixelRotate3
	jsr.w StoreIntroPixel
	iny
	iny
	dec.b $75
	beq .2
	jmp.w .loop
.2:									; A 16-bit, A = Y, A + $0010, Y = A, ...
	rep #$20
	tya
	clc
	adc.w #$0010
	tay
	dec.b $77
	beq .3
	jmp.w .1
.3:									; pull X, push X, A = $28,x, A * 2, ...
	plx
	phx
	lda.b $28,x
	asl a
	adc.b $26,x
	tax
	lda.b $00,x
	tax
	lda.b $00,x
	and.w #$FF00
	tay
	lda.w #$0040
	sta.b a4
	dec.b QueueBusy
	lda.b VRAMModeQueueSP
	tsx
	tcs
	stx.b VRAMModeQueueSP
	lda.w brightness
	cmp.w #$0080
	bne .loop2
	tya
	bra .5
.loop2:								; loop: A = Y, A xor $FFFF, A + 1, if A >= d3 go to .4, ...
	tya
	eor.w #$FFFF
	inc a
	cmp.b d3
	bcs .4
	lda.b d3
.4:									; A xor $FFFF, A + 1
	eor.w #$FFFF
	inc a
.5:									; push A, $75 = A, A = VRAMModeQueueSP, VRAMModeQueueSP = X, ...
	pha
	sta.b $75
	pea.w $0080
	pei ($73)
	pea.w $1900
	pea.w $007E
	pei ($08)
	lda.b VRAMModeQueueSP
	tsx
	tcs
	stx.b VRAMModeQueueSP
	stz.b QueueBusy
	lda.b $75
	adc.b a4
	sta.b a4
	lda.b $08
	adc.b $75
	sta.b $08
	tya
	sec
	sbc.b $75
	tay
	beq .6
	inc.w TransfersReady
	wai
	lda.w #$F254
	sta.b d3
	dec.b QueueBusy
	lda.b VRAMModeQueueSP
	tsx
	tcs
	stx.b VRAMModeQueueSP
	bra .loop2
.6:									; A = d3, A + $75, d3 = A, if A < $FF10 go to .7, ...
	lda.b d3
	clc
	adc.b $75
	sta.b d3
	cmp.w #$FF10
	bcc .7
	inc.w TransfersReady
	wai
.7:									; X = $08, Y = $0E00
	ldx.b $08
	ldy.w #$0E00
.loop3:								; loop: $0000,x = 0, X + 1, X + 1, Y - 1, ...
	stz.w $0000,x
	inx
	inx
	dey
	bne .loop3
	ply
	lda.w $0028,y
	asl a
	adc.w $0026,y
	tax
	lda.b $00,x
	tax
	lda.b $02,x
	tax
	lda.l SpritePieces,x
	eor.w #$FFFF
	inc a
	sta.w introM7X
	lda.l SpritePieces+2,x
	eor.w #$FFFF
	inc a
	sta.w introM7Y
	lda.w $0005,y
	sec
	sbc.w introM7X
	eor.w #$FFFF
	inc a
	sta.w BG1HScroll
	lda.w $0008,y
	sec
	sbc.w introM7Y
	eor.w #$FFFF
	sta.w BG1VScroll
	bit.b d0+2
	bpl .8
	lda.w $0005,y
	sec
	sbc.w #$0100
	eor.w #$FFFF
	inc a
	sec
	sbc.w introM7X
	eor.w #$FFFF
	inc a
	sta.w BG1HScroll
	lda.w #$0001
	tsb.w introM7SEL
	bra .9
.8:									; A = $0001
	lda.w #$0001
	trb.w introM7SEL
.9:									; a4 = $0001, push X, A = $0028,y, A * 2, ...
	lda.w #$0001
	sta.b a4
	phx
	lda.w $0028,y
	asl a
	adc.w $0026,y
	tax
	lda.b $00,x
	tax
	lda.b $01,x
	and.w #$00FF
	plx
	sta.b $77
	asl a
	inc a
	sta.b $75
.loop4:								; loop: A = SpritePieces+4,x, A and $00FF, A / 2, A / 2, ...
	lda.l SpritePieces+4,x
	and.w #$00FF
	lsr a
	lsr a
	lsr a
	sta.b $79
	lda.l SpritePieces+5,x
	and.w #$00FF
	asl a
	asl a
	asl a
	asl a
	adc.b $79
	adc.b $08
	tay
	sep #$20
	lda.b a4
	sta.w $0000,y
	inc a
	sta.w $0001,y
	inc a
	sta.b a4
	lda.b $75
	sta.w $0080,y
	inc a
	sta.w $0081,y
	inc a
	sta.b $75
	rep #$20
	inx
	inx
	dec.b $77
	bne .loop4
	dec.b QueueBusy
	lda.b VRAMModeQueueSP
	tsx
	tcs
	stx.b VRAMModeQueueSP
	stz.b a4
	lda.b $08
	clc
	ldx.w #$000A
.loop5:								; loop: push A, A = a4, A + $0080, a4 = A, ...
	pea.w $0018
	pea.w $0000
	pei ($73)
	pea.w $1800
	pea.w $007E
	pha
	lda.b a4
	adc.w #$0080
	sta.b a4
	adc.b $08
	dex
	bpl .loop5
	lda.b VRAMModeQueueSP
	tsx
	tcs
	stx.b VRAMModeQueueSP
	stz.b QueueBusy
	inc.w TransfersReady
	wai
	rts

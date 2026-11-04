BuildSpriteOAM:						; build the OAM entries of all sprite objects (frames, SpritePieces)
	lda.w SpriteCount
	bne .1
	rtl
.1:									; QueueBusy - 1, $16 = X, X = $28, A - 1, ...
	dec.b QueueBusy
	tsx
	stx.b $16
	ldx.b $28
	txs
	dec a
	asl a
	tay
.loop:								; loop: X = SpriteList,y, A = $22,x, A / 2, if carry set go to .3, ...
	ldx.w SpriteList,y
	lda.b $22,x
	lsr a
	bcs .3
	dey
	dey
	bpl .loop
.2:									; $28 = A, X = $16, QueueBusy = 0, return
	tsc
	sta.b $28
	ldx.b $16
	txs
	stz.b QueueBusy
	rtl
.3:									; $0E = X, $10 = X, r0+2 = Y, A = $05,x, ...
	stx.b $0E
	stx.b $10
	sty.b r0+2
	lda.b $05,x
	sec
	sbc.b $22
	sta.b $12
	lda.b $08,x
	sec
	sbc.b $24
	sta.b $14
	lda.b $28,x
	bpl .4
	jmp.w .40
.4:									; A = $36,x, if $4000 bits clear go to .5, go to .23
	lda.b $36,x
	bit.w #$4000
	beq .5
	jmp.w .23
.5:									; A = $10,x, A / 2, A / 2, A / 2, ...
	lda.b $10,x
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$01FF
	sta.b tmp2
	lda.b $14,x
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$01FF
	sta.b tmp3
	lda.b $34,x
	and.w #$FF00
	asl a
	ora.b $36,x
	tsb.b tmp2
	tsb.b tmp3
	lda.b $28,x
.6:									; A * 2, A + $26,x, X = A, A = $00,x, ...
	asl a
	adc.b $26,x
	tax
	lda.b $00,x
	tax
	lda.b $00,x
	and.w #$00FF
	sta.b tmp0
	lda.b $01,x
	and.w #$00FF
	sta.b tmp1
	lda.b $02,x
	tax
	lda.l SpritePieces,x
	adc.b $12
	sta.b $0A
	clc
	lda.l SpritePieces+2,x
	adc.b $14
	sta.b $0C
	dec.b tmp0
	bmi .13
.7:									; Y = $0000, A = SpritePieces+4,x, A and $00FF, A + $0A, ...
	pei ($A3)
	ldy.w #$0000
	clc
	lda.l SpritePieces+4,x
	and.w #$00FF
	adc.b $0A
	bpl .8
	cmp.w #$FFF9
	bcc .9
	iny
	and.w #$00FF
.8:									; if A >= $0100 go to .9, r0 = A, A = SpritePieces+5,x, A and $00FF, ...
	cmp.w #$0100
	bcs .9
	sta.b r0
	lda.l SpritePieces+5,x
	and.w #$00FF
	adc.b $0C
	bpl .10
	cmp.w #$FFF9
	and.w #$00FF
	bcs .11
.9:									; pull A, go to .12
	pla
	bra .12
.10:								; if A >= $00E0 go to .9
	cmp.w #$00E0
	bcs .9
.11:								; A or r0, push A, A = Y, Y = $2A, ...
	xba
	ora.b r0
	pha
	tya
	ldy.b $2A
	sta.w $0000,y
	iny
	sty.b $2A
.12:								; tmp2 + 1, X + 1, X + 1, tmp0 - 1, ...
	inc.b tmp2
	inx
	inx
	dec.b tmp0
	bpl .7
.13:								; tmp1 - 1, if the result < 0 go to .21
	dec.b tmp1
	bmi .21
.14:								; Y = $0002, A = SpritePieces+4,x, A and $00FF, A + $0A, ...
	pei ($A5)
	ldy.w #$0002
	clc
	lda.l SpritePieces+4,x
	and.w #$00FF
	adc.b $0A
	bpl .15
	cmp.w #$FFF1
	bcc .16
	iny
	and.w #$00FF
.15:								; if A >= $0100 go to .16, r0 = A, A = SpritePieces+5,x, A and $00FF, ...
	cmp.w #$0100
	bcs .16
	sta.b r0
	lda.l SpritePieces+5,x
	and.w #$00FF
	adc.b $0C
	bpl .17
	cmp.w #$FFF1
	and.w #$00FF
	bcs .18
.16:								; pull A, go to .19
	pla
	bra .19
.17:								; if A >= $00E0 go to .16
	cmp.w #$00E0
	bcs .16
.18:								; A or r0, push A, A = Y, Y = $2A, ...
	xba
	ora.b r0
	pha
	tya
	ldy.b $2A
	sta.w $0000,y
	iny
	sty.b $2A
.19:								; A = tmp3, A + 1, A + 1, if $0010 bits clear go to .20, ...
	lda.b tmp3
	inc a
	inc a
	bit.w #$0010
	beq .20
	clc
	adc.w #$0010
.20:								; tmp3 = A, X + 1, X + 1, tmp1 - 1, ...
	sta.b tmp3
	inx
	inx
	dec.b tmp1
	bpl .14
.21:								; A, X / Y 16-bit, X = $0E, if $2A,x >= 0 go to .22, go to .40
	rep #$30
	ldx.b $0E
	lda.b $2A,x
	bpl .22
	jmp.w .40
.22:								; X + 1, X + 1, $0E = X, X = $10, ...
	inx
	inx
	stx.b $0E
	ldx.b $10
	jmp.w .6
.23:								; A = $10,x, A / 2, A / 2, A / 2, ...
	lda.b $10,x
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$01FF
	sta.b tmp2
	lda.b $14,x
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$01FF
	sta.b tmp3
	lda.b $34,x
	and.w #$FF00
	asl a
	ora.b $36,x
	tsb.b tmp3
	tsb.b tmp2
	lda.b $28,x
.24:								; A * 2, A + $26,x, X = A, A = $00,x, ...
	asl a
	adc.b $26,x
	tax
	lda.b $00,x
	tax
	lda.b $00,x
	and.w #$00FF
	sta.b tmp0
	lda.b $01,x
	and.w #$00FF
	sta.b tmp1
	lda.b $02,x
	tax
	sec
	lda.b $12
	sbc.l SpritePieces,x
	sec
	sbc.w #$0007
	sta.b $0A
	clc
	lda.l SpritePieces+2,x
	adc.b $14
	sta.b $0C
	dec.b tmp0
	bmi .31
.25:								; Y = $0000, A = SpritePieces+4,x, A and $00FF, A xor $FFFF, ...
	pei ($A3)
	ldy.w #$0000
	sec
	lda.l SpritePieces+4,x
	and.w #$00FF
	eor.w #$FFFF
	adc.b $0A
	bpl .26
	cmp.w #$FFF9
	bcc .27
	iny
	and.w #$00FF
.26:								; if A >= $0100 go to .27, r0 = A, A = SpritePieces+5,x, A and $00FF, ...
	cmp.w #$0100
	bcs .27
	sta.b r0
	lda.l SpritePieces+5,x
	and.w #$00FF
	adc.b $0C
	bpl .28
	cmp.w #$FFF9
	and.w #$00FF
	bcs .29
.27:								; pull A, go to .30
	pla
	bra .30
.28:								; if A >= $00E0 go to .27
	cmp.w #$00E0
	bcs .27
.29:								; A or r0, push A, A = Y, Y = $2A, ...
	xba
	ora.b r0
	pha
	tya
	ldy.b $2A
	sta.w $0000,y
	iny
	sty.b $2A
.30:								; tmp2 + 1, X + 1, X + 1, tmp0 - 1, ...
	inc.b tmp2
	inx
	inx
	dec.b tmp0
	bpl .25
.31:								; A = $0A, A - $0008, $0A = A, tmp1 - 1, ...
	sec
	lda.b $0A
	sbc.w #$0008
	sta.b $0A
	dec.b tmp1
	bmi .39
.32:								; Y = $0002, A = SpritePieces+4,x, A and $00FF, A xor $FFFF, ...
	pei ($A5)
	ldy.w #$0002
	sec
	lda.l SpritePieces+4,x
	and.w #$00FF
	eor.w #$FFFF
	adc.b $0A
	bpl .33
	cmp.w #$FFF1
	bcc .34
	iny
	and.w #$00FF
.33:								; if A >= $0100 go to .34, r0 = A, A = SpritePieces+5,x, A and $00FF, ...
	cmp.w #$0100
	bcs .34
	sta.b r0
	lda.l SpritePieces+5,x
	and.w #$00FF
	adc.b $0C
	bpl .35
	cmp.w #$FFF1
	and.w #$00FF
	bcs .36
.34:								; pull A, go to .37
	pla
	bra .37
.35:								; if A >= $00E0 go to .34
	cmp.w #$00E0
	bcs .34
.36:								; A or r0, push A, A = Y, Y = $2A, ...
	xba
	ora.b r0
	pha
	tya
	ldy.b $2A
	sta.w $0000,y
	iny
	sty.b $2A
.37:								; A = tmp3, A + 1, A + 1, if $0010 bits clear go to .38, ...
	lda.b tmp3
	inc a
	inc a
	bit.w #$0010
	beq .38
	clc
	adc.w #$0010
.38:								; tmp3 = A, X + 1, X + 1, tmp1 - 1, ...
	sta.b tmp3
	inx
	inx
	dec.b tmp1
	bpl .32
.39:								; X = $0E, if $2A,x < 0 go to .40, X + 1, X + 1, ...
	rep #$31
	ldx.b $0E
	lda.b $2A,x
	bmi .40
	inx
	inx
	stx.b $0E
	ldx.b $10
	jmp.w .24
.40:								; Y = r0+2, Y - 1, Y - 1, if the result < 0 go to .41, ...
	ldy.b r0+2
	dey
	dey
	bmi .41
	jmp.w .loop
.41:								; go to .2
	jmp.w .2

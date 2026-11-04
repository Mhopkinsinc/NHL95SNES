UnpackText:							; unpacks the packed text at X in bank $C3 into a new work buffer ($3C
									; bytes, AllocWorkBuf); returns X = the text, zero ended
	phy
	stx.b $16
	lda.w #$003C
	jsl.l AllocWorkBuf
DecodePackedText:					; decode packed text symbols into the allocated string buffer
	pha
	tay
	lda.w #$0041
	sta.b $14
	stz.b $0A
.1:									; call ReadTextFiveBits, if A < $1A go to .5, if A = $1B go to .7, ...
	jsr.w ReadTextFiveBits
	cmp.b #$1A
	bcc .5
	cmp.b #$1B
	beq .7
	bcc .8
	cmp.b #$1D
	beq .9
	bcc .3
	cmp.b #$1F
	bcc .2
	jsr.w ReadTextThreeBits
	clc
	adc.b #$10
	bra .10
.2:									; call ReadTextThreeBits, A + $08, go to .10
	jsr.w ReadTextThreeBits
	clc
	adc.b #$08
	bra .10
.3:									; if $41 is not $14 go to .4, A = $61
	lda.b #$41
	cmp.b $14
	bne .4
	lda.b #$61
.4:									; $14 = A, go to .1
	sta.b $14
	bra .1
.5:									; A + $14
	adc.b $14
.6:									; $0000,y = A, Y + 1, go to .1
	sta.w $0000,y
	iny
	bra .1
.7:									; A = $20, go to .6
	lda.b #$20
	bra .6
.8:									; $0000,y = $00, A 16-bit, pull X, pull Y, ...
	lda.b #$00
	sta.w $0000,y
	rep #$20
	plx
	ply
	rtl
.9:									; call ReadTextThreeBits
	jsr.w ReadTextThreeBits
.10:								; X = A, A = PackedTextSymbols,x, go to .6
	tax
	lda.l PackedTextSymbols,x
	bra .6

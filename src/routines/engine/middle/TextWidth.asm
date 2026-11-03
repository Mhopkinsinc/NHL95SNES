TextWidth:							; the width in pixels of the text at X in the font of $0E (per character
									; widths)
	phx
	lda.b $0E
	bit.w #$0004
	beq .6
	stz.b $0A
	txy
.1:									; A = $0000,y, if the result = 0 go to .5, Y + 1, ...
	lda.w $0000,y
	and.w #$00FF
	beq .5
	iny
	cmp.w #$0020
	bne .2
	lda.w #$0004
	bra .4
.2:									; A - $0030, X = A, if A < $0031 go to .3, A - $0020, ...
	sec
	sbc.w #$0030
	tax
	cmp.w #$0031
	bcc .3
	sbc.w #$0020
	tax
.3:									; A = ThinFontWidths,x, A and $007F
	lda.l ThinFontWidths,x
	and.w #$007F
.4:									; A + $0A, $0A = A, go to .1
	clc
	adc.b $0A
	sta.b $0A
	bra .1
.5:									; A = $0A, pull X, return
	lda.b $0A
	plx
	rtl
.6:									; A = TextColLow, push A, A = TextColHigh, push A, ...
	lda.w TextColLow
	pha
	lda.w TextColHigh
	pha
	lda.w #$0000
	jsl.l DrawText
	ldy.w #$0400
	lda.b $0E
	lsr a
	bcs .7
	ldy.w #$0200
.7:									; A = Y, call FreeWorkBuf, A = $0A, pull A, ...
	tya
	jsl.l FreeWorkBuf
	lda.b $0A
	pla
	sta.w TextColHigh
	pla
	sta.w TextColLow
	plx
	rtl

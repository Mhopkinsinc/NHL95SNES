DrawText:							; draws the text at X (zero ended) from pixel column A into new work
									; buffer tiles, in the font of $0C (bank $C0) with the flags of $0E
	sta.b $12
	sta.b $0A
	cmp.w TextColLow
	bcs .1
	sta.w TextColLow
.1:									; Y = $0400, A = $0E, A / 2, if carry set go to .2, ...
	ldy.w #$0400
	lda.b $0E
	lsr a
	bcs .2
	ldy.w #$0200
.2:									; A = Y, call AllocClearWorkBuf, tmp3 = A, push X
	tya
	jsl.l AllocClearWorkBuf
	sta.b tmp3
	phx
DrawNextTextCharacter:				; read the next character and prepare its glyph for drawing
	ply
	lda.w $0000,y
	and.w #$00FF
	bne .1
	jmp.w FinishTextDraw
.1:									; Y + 1, push Y, if A is not $0020 go to .3, A = $0E, ...
	iny
	phy
	cmp.w #$0020
	bne .3
	lda.b $0E
	bit.w #$0004
	beq .2
	lda.w #$0004
	jmp.w AdvanceTextCursor
.2:									; A = TextSpaceWidth, go to AdvanceTextCursor
	lda.w TextSpaceWidth
	jmp.w AdvanceTextCursor
.3:									; A - $0030, X = A, if A < $0031 go to .4, A - $0020, ...
	sec
	sbc.w #$0030
	tax
	cmp.w #$0031
	bcc .4
	sbc.w #$0020
	tax
	lda.b $0E
	bit.w #$0002
	beq .4
	txa
	adc.w #$002A
	tax
	lda.l ItalicFontWidths-$2B,x
	bra .7
.4:									; A = $0E, if $0004 bits clear go to .5, A = ThinFontWidths,x, go to .7
	lda.b $0E
	bit.w #$0004
	beq .5
	lda.l ThinFontWidths,x
	bra .7
.5:									; if a $0001 bit set go to .6, A = BoldFontWidths,x, go to .7
	bit.w #$0001
	bne .6
	lda.l BoldFontWidths,x
	bra .7
.6:									; A = ItalicFontWidths,x
	lda.l ItalicFontWidths,x
.7:									; A and $00FF, if overflow clear go to .8, A = p0
	and.w #$00FF
	bit.b $0E
	bvc .8
	lda.b p0
.8:									; p0 = A, A = X, A / 2, A / 2, ...
	sta.b p0
	txa
	xba
	lsr a
	lsr a
	sta.b $10
	lda.b $0E
	lsr a
	bcs .9
	lsr.b $10
	bit.b $0E
	bvs .11
.9:									; A = $0080, if not zero go to .10, A = $0A, A - 1, ...
	lda.w #$0080
	trb.b p0
	bne .10
	lda.b $0A
	dec a
	dec a
	bmi .11
	cmp.b $12
	bcc .11
	sta.b $0A
	jsr.w CheckGlyphLeftOverlap
	bcc .11
	inc.b $0A
	jsr.w CheckGlyphLeftOverlap
	bcc .11
	inc.b $0A
	bra .11
.10:								; if p0 is not $007F go to .11, A = TextSpaceWidth, ...
	lda.b p0
	cmp.w #$007F
	bne .11
	lda.w TextSpaceWidth
	jmp.w AdvanceTextCursor
.11:								; A = $8000, A = $10, A + $0C, X = A, ...
	lda.w #$8000
	trb.b $0E
	lda.b $10
	clc
	adc.b $0C
	tax
	adc.w #$0010
	sta.b p0+2
	lda.b $0A
	and.w #$FFF8
	asl a
	adc.b tmp3
	tay
DrawGlyphRow:						; load a glyph row and dispatch by its destination pixel column
	phx
	phy
	sep #$20
	lda.l $C00000,x
	sta.b $17
	lda.l $C00010,x
	sta.b $16
	lda.l $C00001,x
	sta.b $15
	lda.l $C00011,x
	sta.b $14
	rep #$20
	lda.b $0A
	and.w #$0007
	asl a
	tax
	lda.l GlyphPixelRoutines,x
	pha
	ldx.b p0
	rts

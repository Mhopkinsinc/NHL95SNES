NameEntry:							; Create Player name entry, screen states 0 and 1 (first and last name):
									; pad to a letter, B to select, Y to go back, start when done, X cancels;
									; after the last name it asks Is the player name ok
	lda.w repeatdelayframes
	beq .1
	cmp.w #$0014
	bcc NameEntryReturn
	lda.w #$0010
	sta.w repeatdelayframes
.1:									; A = padchangeany, if a $0800 bit set go to .4, ...
	lda.w padchangeany
	bit.w #$0800
	bne .4
	bit.w #$0400
	bne .3
	bit.w #$0200
	bne .7
	bit.w #$0100
	bne .8
	bit.w #$8080
	bne .12
	bit.w #$4030
	bne .9
	bit.w #$1000
	beq .2
	jmp.w .15
.2:									; if $0040 bits clear go to .rts, go to ExitCreatePlayer
	bit.w #$0040
	beq .rts
	jmp.w ExitCreatePlayer
.rts:								; return
	rts
.3:									; call LetterCellPalette3, A = d6, A + $0009, if A < $001B go to .5, ...
	jsr.w LetterCellPalette3
	clc
	lda.b d6
	adc.w #$0009
	cmp.w #$001B
	bcc .5
	sbc.w #$001B
	sta.b d6
	jmp.w MoveCreateGridCursor
.4:									; call LetterCellPalette3, A = d6, A - $0009, if carry set go to .5, ...
	jsr.w LetterCellPalette3
	sec
	lda.b d6
	sbc.w #$0009
	bcs .5
	adc.w #$001B
.5:									; d6 = A
	sta.b d6
.6:									; go to MoveCreateGridCursor
	jmp.w MoveCreateGridCursor
.7:									; call LetterCellPalette3, d6 - 1, if the result >= 0 go to .6, ...
	jsr.w LetterCellPalette3
	dec.b d6
	bpl .6
	lda.w #$001A
	bra .5
.8:									; call LetterCellPalette3, A = d6, A + 1, if A < $001B go to .5, ...
	jsr.w LetterCellPalette3
	lda.b d6
	inc a
	cmp.w #$001B
	bcc .5
	stz.b d6
	bra .6
.9:									; A, X / Y 8-bit, A = $3E, Y = a1+2, Y - 1, ...
	sep #$30
	lda.b #$3E
	ldy.b a1+2
	dey
	cpy.b a3
	bne .10
	cmp.w mesarea,y
	bne .11
.10:								; if a3 = 0 go to .11, Y - 1
	ldy.b a3
	beq .11
	dey
.11:								; mesarea,y = A, a3 = Y, go to .14
	sta.w mesarea,y
	sty.b a3
	bra .14
.12:								; A, X / Y 8-bit, X = d6, A = LetterGridChars,x, if a3 = 0 go to .13, ...
	sep #$30
	ldx.b d6
	lda.l LetterGridChars,x
	ldy.b a3
	beq .13
	lda.l LetterGridChars+$1B,x
.13:								; mesarea,y = A, Y + 1, if Y >= a1+2 go to .14, a3 = Y
	sta.w mesarea,y
	iny
	cpy.b a1+2
	bcs .14
	sty.b a3
.14:								; A, X / Y 16-bit, A = $000F, Y = a3+2, X = mesarea, ...
	rep #$30
	lda.w #$000F
	ldy.b a3+2
	ldx.w #mesarea
	jsl.l PrintItalicFixedLeftStr
	jsl.l WaitTransfers
	rts
.15:								; if a3 is not 0 go to .16, return
	lda.b a3
	bne .16
	rts
.16:								; if d6+2 is not 0 go to .17, d6+2 + 1, call ClearNameField, ...
	lda.b d6+2
	bne .17
	inc.b d6+2
	jsr.w ClearNameField
	jsr.w EnteredNameLength
	tyx
	stz.w mesarea,x
	tya
	sta.w CreateFirstName
	ldx.w #mesarea
	ldy.w #$4673
	mvn $7E,$7E
	ldy.b a3+2
	ldx.w #$4673
	jsl.l PrintItalicLeftStr
	jsl.l SendTextMap
	lda.w #$3E3E
	sta.w mesarea
	sta.w mesarea+2
	sta.w mesarea+4
	sta.w mesarea+6
	sta.w mesarea+8
	stz.w mesarea+10
	lda.w #$0008
	sta.b a3+2
	lda.w #$000A
	sta.b a1+2
	stz.b a3
	jsl.l WaitTransfers
	rts
.17:								; call ClearNameField, call EnteredNameLength, X = Y, mesarea,x = 0, ...
	jsr.w ClearNameField
	jsr.w EnteredNameLength
	tyx
	stz.w mesarea,x
	tya
	sta.w CreateLastName
	ldx.w #mesarea
	ldy.w #$467D
	mvn $7E,$7E
	ldy.b a3+2
	ldx.w #$467D
	jsl.l PrintItalicLeftStr
	ldy.w #$0200
	clc
	lda.b $D3
	adc.w #$0300
	jsl.l ClearRAM7E
	jsl.l WaitTransfers
	lda.w #NameOkPage&$FFFF
	jsl.l PrintTextPage
	inc.b d6+2
	jmp.w SelectNameYes

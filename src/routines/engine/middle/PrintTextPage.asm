PrintTextPage:						; prints the text page whose descriptor is at A in bank $C3: the margins,
									; a title, then texts with their rows and print flags to a zero
	pha
	jsl.l RestoreWorkBuf
	plx
	phx
	lda.l $C30000,x
	sta.b $CF
	lda.l $C30002,x
	sta.b $D1
	lda.l $C30004,x
	beq .1
	pha
	lda.l $C30006,x
	tay
	plx
	jsl.l PrintTitle
.1:									; pull X
	plx
.2:									; if $C30008,x = 0 go to .11, if $C30008,x is not $FFFF go to .3, ...
	lda.l $C30008,x
	beq .11
	cmp.w #$FFFF
	bne .3
	lda.l $C3000A,x
	sta.b $CF
	bra .10
.3:									; push X, push A, A = $C3000A,x, pull X, ...
	phx
	pha
	lda.l $C3000A,x
	plx
	pha
	and.w #$3FFF
	tay
	pla
	bpl .6
	bit.w #$2000
	beq .4
	jsl.l PrintBoldRight
	bra .9
.4:									; if $4000 bits clear go to .5, call PrintBoldCentred, go to .9
	bit.w #$4000
	beq .5
	jsl.l PrintBoldCentred
	bra .9
.5:									; call PrintBoldLeft, go to .9
	jsl.l PrintBoldLeft
	bra .9
.6:									; if $4000 bits clear go to .7, call PrintItalicCentred, go to .9
	bit.w #$4000
	beq .7
	jsl.l PrintItalicCentred
	bra .9
.7:									; if a $2000 bit set go to .8, call PrintItalicLeft, go to .9
	bit.w #$2000
	bne .8
	jsl.l PrintItalicLeft
	bra .9
.8:									; call PrintItalicRight
	jsl.l PrintItalicRight
.9:									; pull X
	plx
.10:								; X + 1, X + 1, X + 1, X + 1, ...
	inx
	inx
	inx
	inx
	bra .2
.11:								; call SendTextMap, go to RestoreWorkBuf
	jsl.l SendTextMap
	jmp.w RestoreWorkBuf

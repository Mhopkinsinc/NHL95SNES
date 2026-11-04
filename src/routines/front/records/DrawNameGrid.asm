DrawNameGrid:						; draws the letter grid and its keys for EditUserName
	lda.b $D3
	clc
	adc.w #$0380
	ldy.w #$0380
	jsl.l ClearRAM7E
	lda.w #$0018
	sta.b $CF
	lda.w #$2C00
	sta.b $D5
	lda.w #$001A
	ldy.w #$000F
	ldx.w #TxtAbcdefghi&$FFFF
	jsl.l PrintItalicFixedLeft
	lda.w #$001A
	ldy.w #$0012
	ldx.w #TxtJklmnopqr&$FFFF
	jsl.l PrintItalicFixedLeft
	lda.w #$001A
	ldy.w #$0015
	ldx.w #TxtStuvwxyz2&$FFFF
	jsl.l PrintItalicFixedLeft
	lda.w #$2000
	sta.b $D5
	lda.w #NameGridPage&$FFFF
	jsl.l PrintTextPage
	ldx.w #$0000
	stx.b a1+2
	cpx.w #$000C
	bne .1
	dec.b a1+2
.1:									; A = $003E
	lda.w #$003E
.loop:								; loop: if X = $000C go to .2, mesarea,x = A, X + 1, go to .loop
	cpx.w #$000C
	beq .2
	sta.w mesarea,x
	inx
	bra .loop
.2:									; call PrintEditedName, X = a0, A = $0000, call SetSpriteAnim, ...
	jsr.w PrintEditedName
	ldx.b a0
	lda.w #$0000
	jsl.l SetSpriteAnim
	stz.b a1
	jsr.w MoveGridCursor
	rts

PrintLinePlayerHeader:				; the list header on text row 12: 'Player' from x $1E, the title of stat
									; column $7D (RatingNames) right-aligned to x $F0
	lda.w #$000C
	sta.b a2+2
	jsr.w ClearTextRow
	lda.w #$001E
	sta.b $CF
	lda.w #$00D0
	sta.b $D1
	ldx.w #TxtPlayer&$FFFF
	ldy.b a2+2
	jsl.l PrintBoldLeft
	lda.b $D1
	sta.b $CF
	lda.w #$00F0
	sta.b $D1
	lda.b $7D
	asl a
	tax
	lda.l RatingNames,x
	tax
	ldy.b a2+2
	jsl.l PrintBoldRight
	rts

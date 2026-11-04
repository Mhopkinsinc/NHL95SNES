PackFadeColours:					; writes the colour fade's d3 current colours as BGR words at A (the 8.8
									; values' integer parts)
	tax
	lda.b d3
	jsr.w SetFadeTables
	lda.b d3
	sta.b $77
	ldy.w #$0000
.loop:								; loop: A = (a0),y, A and $00FF, push A, A = ($65),y, ...
	lda.b (a0),y
	xba
	and.w #$00FF
	pha
	lda.b ($65),y
	xba
	and.w #$00FF
	asl a
	asl a
	asl a
	asl a
	asl a
	ora.b $01,s
	sta.b $01,s
	lda.b (a1),y
	and.w #$FF00
	asl a
	asl a
	ora.b $01,s
	sta.b $01,s
	pla
	sta.w $0000,x
	inx
	inx
	iny
	iny
	dec.b $77
	bne .loop
	rtl

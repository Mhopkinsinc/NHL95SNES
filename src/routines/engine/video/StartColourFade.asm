StartColourFade:					; sets up a fade of d3 colours from the palette at [a3] to the one at [a4]
									; in $7D steps: each colour's red, green and blue as 8.8 values and a step
									; for each (FadeDelta), in the tables at Y
	sta.b a4
	stx.b $75
	lda.b d3
	jsr.w SetFadeTables
	ldx.b d3
	ldy.w #$0000
.loop:								; loop: A = [a3],y, push A, A and $001F, $77 = A, ...
	lda.b [a3],y
	pha
	and.w #$001F
	sta.b $77
	xba
	sta.b (a0),y
	lda.b $01,s
	and.w #$03E0
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	sta.b $79
	xba
	sta.b ($65),y
	pla
	and.w #$7C00
	xba
	lsr a
	lsr a
	sta.b $7B
	xba
	sta.b (a1),y
	lda.b [a4],y
	pha
	and.w #$001F
	sec
	sbc.b $77
	jsr.w FadeDelta
	sta.b ($69),y
	lda.b $01,s
	and.w #$03E0
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	sec
	sbc.b $79
	jsr.w FadeDelta
	sta.b (a2),y
	pla
	and.w #$7C00
	xba
	lsr a
	lsr a
	sec
	sbc.b $7B
	jsr.w FadeDelta
	sta.b ($6D),y
	iny
	iny
	dex
	bne .loop
	rtl

StepColourFade:						; one step of the colour fade: the red, green and blue step tables added
									; to the d3 colours' values
	lda.b d3
	jsr.w SetFadeTables
	ldx.b d3
	ldy.w #$0000
.loop:								; loop: A = (a0),y, A + ($69),y, (a0),y = A, A = ($65),y, ...
	lda.b (a0),y
	clc
	adc.b ($69),y
	sta.b (a0),y
	lda.b ($65),y
	clc
	adc.b (a2),y
	sta.b ($65),y
	lda.b (a1),y
	clc
	adc.b ($6D),y
	sta.b (a1),y
	iny
	iny
	dex
	bne .loop
	rtl

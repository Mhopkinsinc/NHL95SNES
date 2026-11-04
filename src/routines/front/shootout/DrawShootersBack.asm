DrawShootersBack:					; the shooters back with its drawing gone: the eraser box and the print
									; parameters only
	lda.w #$0020
	sta.b d0
	lda.w #$000D
	sta.b d1
	lda.w blankchar
	sta.b d2
	jsl.l eraser
	lda.w #$0800
	sta.w printa
	lda.w #$000E
	sta.b d0
	lda.w #$0003
	sta.b d1
	lda.w #$007F
	sta.b p0+2
	stz.b p0
	lda.w #$0020
	lda.w #$001C
	ldx.w #$0000
	ldy.w #$0000
	lda.w charofs2
	clc
	adc.w #$0C00
	rtl

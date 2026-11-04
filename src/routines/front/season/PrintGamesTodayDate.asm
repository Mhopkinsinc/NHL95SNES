PrintGamesTodayDate:				; prints day d0's date (MakeDateString) in italics on row 5, the row
									; cleared first
	lda.b $D3
	clc
	adc.w #$0140
	ldy.w #$0080
	jsl.l ClearRAM7E
	lda.b d0
	jsr.w MakeDateString
	lda.w #$0030
	sta.b $CF
	ldx.w #mesarea
	ldy.w #$0005
	jsl.l PrintItalicLeftStr
	jsl.l SendTextMap
	rts

PrintLineSlot:						; prints slot a3 of the edited line on row $6D: its position name
									; (PositionNames) and its player
	lda.w #$0020
	sta.b $CF
	lda.w #$0040
	sta.b $D1
	lda.b a3
	asl a
	tax
	lda.l PositionNames,x
	tax
	ldy.b a2+2
	jsl.l PrintBoldCentred
	lda.b $D1
	sta.b $CF
	lda.w #$00F0
	sta.b $D1
	lda.b $79
	asl a
	asl a
	asl a
	adc.b a3
	adc.b a0+2
	inc a
	tax
	lda.w $0000,x
	and.w #$00FF
	dec a
	sta.b d0
	asl a
	adc.b a0
	tax
	lda.w $0008,x
	sta.b d0+2
	lda.b d0
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.b a0
	adc.w #$0118
	tax
	ldy.b a2+2
	jsl.l PrintBoldLeftStr
	rts

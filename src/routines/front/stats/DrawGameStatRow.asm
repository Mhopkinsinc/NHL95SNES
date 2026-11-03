DrawGameStatRow:					; draws row a3 of StatsReport' scrolling list: a team stat row
	lda.b a3
	asl a
	asl a
	asl a
	sec
	sbc.b a3
	clc
	adc.b a0
	sta.b a0+2
	tax
	lda.w #$0010
	sta.b $CF
	lda.w #$00F0
	sta.b $D1
	lda.l $C30000,x
	tax
	ldy.b a2+2
	jsl.l PrintBoldCentred
	stz.b a2
	lda.w #$00B8
	sta.b $CF
	lda.w #$00F8
	sta.b $D1
	ldx.b a0+2
	lda.l $C30002,x
	and.w #$00FF
	tax
	jsr (GameStatFormats,x)
	lda.w #$0002
	sta.b a2
	lda.w #$0010
	sta.b $CF
	lda.w #$0038
	sta.b $D1
	ldx.b a0+2
	lda.l $C30002,x
	and.w #$00FF
	tax
	jmp (GameStatFormats,x)

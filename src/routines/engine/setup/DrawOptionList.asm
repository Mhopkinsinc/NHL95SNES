DrawOptionList:						; draws the option list at A in bank $C3 (a count, then lines of name,
									; values, variable, routine) from row $10: up to 4 lines, values centred
									; (right for play mode 7), the arrows set, line 0 palette 0
	tax
	sta.b a3
	pei ($D5)
	lda.w #$2C00
	sta.b $D5
	lda.l $C30000,x
	sta.b a1+2
	dec a
	sta.b tmp0
	stz.b d6
	stz.b d6+2
	lda.w #$0003
	cmp.b tmp0
	bcs .1
	sta.b tmp0
.1:									; Y = $0010
	ldy.w #$0010
.2:									; push Y, push X, $CF = $0010, A = $C30002,x, ...
	phy
	phx
	lda.w #$0010
	sta.b $CF
	lda.l $C30002,x
	tax
	jsl.l PrintItalicLeft
	plx
	phx
	lda.w #$0094
	sta.b $CF
	lda.l $C30006,x
	tay
	lda.w $0000,y
	inc a
	asl a
	adc.l $C30004,x
	tax
	lda.l $C30000,x
	tax
	lda.b $03,s
	tay
	lda.w OptPlayMode
	cmp.w #$0007
	bne .3
	jsl.l PrintItalicRight
	bra .4
.3:									; call PrintItalicCentred
	jsl.l PrintItalicCentred
.4:									; pull X, pull Y, Y + 1, Y + 1, ...
	plx
	ply
	iny
	iny
	clc
	txa
	adc.w #$0008
	tax
	dec.b tmp0
	bpl .2
	pla
	sta.b $D5
	ldx.b a4
	lda.b $22,x
	and.w #$FFFE
	sta.b $22,x
	ldx.b $75
	lda.b $22,x
	and.w #$FFFE
	ldy.b a1+2
	cpy.w #$0005
	bcc .5
	ora.w #$0001
.5:									; $22,x = A, call SetupLinePalette0, return
	sta.b $22,x
	jsr.w SetupLinePalette0
	rtl

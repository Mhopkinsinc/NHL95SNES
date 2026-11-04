DrawGameInSlot:						; draws game $85 for a scroll: its marks (DrawGameMarks), $8D / $8E its
									; two teams, the text of slot $81 cleared and both names printed
	jsr.w DrawGameMarks
	ldx.w #$0058
	stx.b $CF
	ldx.w #$00A0
	stx.b $D1
	lda.b d1+2
	asl a
	adc.b d1
	tax
	lda.l $C30001,x
	sta.b d3+2
	lda.b d0+2
	asl a
	tax
	phx
	lda.l GameSlotOffsets,x
	adc.b $D3
	ldy.w #$01C0
	jsl.l ClearRAM7E
	plx
	lda.l GameSlotRows,x
	tay
	lda.b d3+2
	and.w #$00FF
	asl a
	tax
	lda.l TeamCityNames,x
	tax
	phy
	jsl.l PrintThinCentred
	lda.b $8E
	and.w #$00FF
	asl a
	tax
	lda.l TeamCityNames,x
	tax
	pla
	adc.w #$0003
	tay
	jsl.l PrintThinCentred
	jsl.l SendTextMap
	rts

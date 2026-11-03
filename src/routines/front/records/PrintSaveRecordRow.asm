PrintSaveRecordRow:					; save record A on row $6D: the holder's name, then the saves 'by' the
									; team 'vs' the other team, through PrintRecordCell
	asl a
	tax
	lda.w ListBuf+$20,x
	sta.b a3
	tax
	ldy.w ScratchBuf+$6,x
	beq PrintSaveRecordRow-3
	ldx.w #$0010
	stx.b $CF
	ldx.w #$0060
	stx.b $D1
	adc.w #ScratchBuf+$12
	tax
	ldy.b a2+2
	jsr.w PrintRecordCell
	lda.w #$00F0
	sta.b $D1
	ldx.b a3
	lda.w ScratchBuf+$6,x
	jsr.w BinToBCD
	jsr.w BCDText
	lda.w #$6220
	sta.w mesarea,x
	inx
	inx
	lda.w #$2079
	sta.w mesarea,x
	inx
	inx
	phx
	ldy.b a3
	lda.w ScratchBuf+$8,y
	and.w #$00FF
	tax
	jsr.w TeamNumSecondText
	jsl.l UnpackText
	ply
	jsr.w AppendMesarea
	lda.w #$7620
	sta.w mesarea,y
	iny
	iny
	lda.w #$2073
	sta.w mesarea,y
	iny
	iny
	phy
	ldy.b a3
	lda.w ScratchBuf+$9,y
	and.w #$00FF
	tax
	jsr.w TeamNumSecondText
	jsl.l UnpackText
	ply
	jsr.w AppendMesarea
	lda.w #$0000
	sta.w mesarea,y
	ldx.w #mesarea
	ldy.b a2+2
PrintRecordCell:					; PrintBoldCentredStr, then the next column ($D1) becomes the current one
									; ($CF)
	jsl.l PrintBoldCentredStr
	lda.b $D1
	sta.b $CF
	rts

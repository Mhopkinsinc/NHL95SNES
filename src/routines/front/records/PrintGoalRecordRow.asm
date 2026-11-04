PrintGoalRecordRow:					; goal record A on row $6D: the holder's name, then the goals 'by' the
									; team 'vs' the other team; nothing (row $6D taken back) when the record's
									; wins are 0
	asl a
	tax
	lda.w ListBuf+$10,x
	sta.b a3
	tax
	ldy.w ScratchBuf+$A,x
	beq PrintGoalRecordsReturn
	ldx.w #$0010
	stx.b $CF
	ldx.w #$0060
	stx.b $D1
	adc.w #ScratchBuf+$12
	tax
	ldy.b a2+2
	jsr.w PrintGoalRecordCell
	lda.w #$00F0
	sta.b $D1
	ldx.b a3
	lda.w ScratchBuf+$2,x
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
	lda.w ScratchBuf+$4,y
	and.w #$00FF
	tax
	jsr.w TeamNumSecondText
	jsl.l UnpackText
	ply
	jsr.w AppendGoalMesarea
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
	lda.w ScratchBuf+$5,y
	and.w #$00FF
	tax
	jsr.w TeamNumSecondText
	jsl.l UnpackText
	ply
	jsr.w AppendGoalMesarea
	lda.w #$0000
	sta.w mesarea,y
	ldx.w #mesarea
	ldy.b a2+2
PrintGoalRecordCell:				; PrintBoldCentredStr, then the next column ($D1) becomes the current one
									; ($CF)
	jsl.l PrintBoldCentredStr
	lda.b $D1
	sta.b $CF
	rts

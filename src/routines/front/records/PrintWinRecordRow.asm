PrintWinRecordRow:					; win page row A on text row $6D: the user's name, win %, wins, losses and
									; ties of the record the win order list gives
	ldx.w #$0010
	stx.b $CF
	ldx.w #$0060
	stx.b $D1
	asl a
	tax
	lda.w ListBuf,x
	sta.b a3
	adc.w #ScratchBuf+$12
	tax
	ldy.b a2+2
	jsr.w PrintWinRecordCell
	ldx.b a3
	lda.w #$0088
	sta.b $D1
	lda.w ScratchBuf+$10,x
	jsr.w PrintWinRecordNumber
	lda.w #$00A8
	sta.b $D1
	lda.w ScratchBuf+$A,x
	jsr.w PrintWinRecordNumber
	lda.w #$00C8
	sta.b $D1
	lda.w ScratchBuf+$E,x
	jsr.w PrintWinRecordNumber
	lda.w #$00E8
	sta.b $D1
	lda.w ScratchBuf+$C,x
PrintWinRecordNumber:				; A as a number (BinToBCD, BCDText) centred in the cell $CF-$D1 on row
									; $6D, then $CF = $D1 and X = a3
	jsr.w BinToBCD
	jsr.w BCDText
	ldx.w #mesarea
	ldy.b a2+2
PrintWinRecordCell:					; PrintBoldCentredStr of X on row Y, then the next column ($D1) becomes
									; the current one ($CF) and X = a3
	jsl.l PrintBoldCentredStr
	lda.b $D1
	sta.b $CF
	ldx.b a3
	rts

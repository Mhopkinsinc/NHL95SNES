PrintGoalRecords:					; Record Holders page 1: the users' goal records (name, Goals)
	lda.w #$0010
	sta.b $CF
	lda.w #$0060
	sta.b $D1
	ldx.w #TxtName&$FFFF
	jsr.w PrintHeadRow6
	lda.w #$00F0
	sta.b $D1
	ldx.w #TxtGoals&$FFFF
	jsr.w PrintHeadRow6
	lda.w #$0008
	sta.b a2+2
	lda.w #$0000
.loop:								; loop: a0+2 = A, call PrintGoalRecordRow, a2+2 + 1, A = a0+2, ...
	sta.b a0+2
	jsr.w PrintGoalRecordRow
	inc.b a2+2
	lda.b a0+2
	inc a
	cmp.b a1
	bne .loop
PrintGoalRecordsReturn:				; takes back one text row and returns after the records or an empty record
	dec.b a2+2
	rts

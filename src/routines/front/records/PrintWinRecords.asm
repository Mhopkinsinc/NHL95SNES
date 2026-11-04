PrintWinRecords:					; Record Holders page 0: name, win %, wins, losses, ties of each user
	lda.w #$0010
	sta.b $CF
	lda.w #$0060
	sta.b $D1
	ldx.w #TxtName&$FFFF
	jsr.w PrintHeadRow6
	lda.w #$0088
	sta.b $D1
	ldx.w #TxtWin&$FFFF
	jsr.w PrintHeadRow6
	lda.w #$00A8
	sta.b $D1
	ldx.w #TxtWin2&$FFFF
	jsr.w PrintHeadRow6
	lda.w #$00C8
	sta.b $D1
	ldx.w #TxtLose&$FFFF
	jsr.w PrintHeadRow6
	lda.w #$00E8
	sta.b $D1
	ldx.w #TxtTie&$FFFF
	jsr.w PrintHeadRow6
	lda.w #$0008
	sta.b a2+2
	lda.w #$0000
.loop:								; loop: a0+2 = A, call PrintWinRecordRow, a2+2 + 1, A = a0+2, ...
	sta.b a0+2
	jsr.w PrintWinRecordRow
	inc.b a2+2
	lda.b a0+2
	inc a
	cmp.b a1
	bne .loop
	rts

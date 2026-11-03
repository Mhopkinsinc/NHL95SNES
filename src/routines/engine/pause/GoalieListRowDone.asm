GoalieListRowDone:					; a goalie row drawn: the next one while below a1, then the None row
	inc.b a2+2
	lda.b a3
	inc a
	sta.b a3
	cmp.b a1
	bne GoalieListRowNext
	ldx.w #$2000
	cmp.b a1+2
	bne .1
	ldx.w #$2400
.1:									; $D5 = X, $CF = $0010, $D1 = $00D0, X = TxtNone&$FFFF, ...
	stx.b $D5
	lda.w #$0010
	sta.b $CF
	lda.w #$00D0
	sta.b $D1
	ldx.w #TxtNone&$FFFF
	ldy.b a2+2
	jsl.l PrintBoldLeft
	lda.w #$2000
	sta.b $D5
	rts

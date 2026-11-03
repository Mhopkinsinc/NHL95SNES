Pausemode_gnum:						; PauseGoalie's goalie list: 'Player' and the title of stat column $7D
									; over title bars, a row per goalie with its stat, then 'None'; the cursor
									; row ($69) in palette 1
	lda.w #$0300
	clc
	adc.b $D3
	ldy.w #$0280
	jsl.l ClearRAM7E
	lda.w #$000C
	sta.b a2+2
	lda.w #$0010
	sta.b $CF
	lda.w #$00D0
	sta.b $D1
	ldx.w #TxtPlayer&$FFFF
	ldy.b a2+2
	jsl.l PrintBoldLeft
	ldy.b a2+2
	iny
	jsl.l PrintTitleBar
	lda.b $D1
	sta.b $CF
	lda.w #$00F0
	sta.b $D1
	lda.b $7D
	asl a
	tax
	lda.l GoalieRatingNames,x
	tax
	ldy.b a2+2
	jsl.l PrintBoldRight
	ldy.b a2+2
	iny
	jsl.l PrintTitleBar
	stz.b a3
	lda.w #$000E
	sta.b a2+2
	lda.w #$0010
	sta.b d4+2
	lda.w #$0001
	sta.w RatingMode
GoalieListRowNext:					; Pausemode_gnum's row loop: goalie a3's row (the cursor row $69 in
									; palette 1) and his stat column (RosterColumnTable), returning to
									; GoalieListRowDone
	jsr.w ClearTextRow
	lda.b a3
	ldx.w #$2000
	sta.b d0
	cmp.b a1+2
	bne .1
	ldx.w #$2400
.1:									; $D5 = X, $CF = $0010, $D1 = $00D0, A * 2, ...
	stx.b $D5
	ldx.w #$0010
	stx.b $CF
	ldx.w #$00D0
	stx.b $D1
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
	lda.b $D1
	sta.b $CF
	lda.w #$00F0
	sta.b $D1
	lda.b $7D
	asl a
	asl a
	tax
	txy
	lda.l GoalieRatingColumns,x
	sta.b d4
	lda.l GoalieRatingColumns+2,x
	tax
	pea.w GoalieListRowDone-1
	jmp (RosterColumnTable,x)

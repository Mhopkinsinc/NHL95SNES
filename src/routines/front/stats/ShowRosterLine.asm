ShowRosterLine:						; TeamRosterScreen's page of team a2: the line title ($79, 0 the goalies)
									; and the title of stat column $7D, then a row per player of the line: its
									; position, name and stat (RosterColumnTable)
	lda.w #$02C0
	clc
	adc.b $D3
	pha
	ldy.w #$0300
	jsl.l ClearRAM7E
	sec
	pla
	sbc.w #$0040
	ldy.w #$0028
	jsl.l ClearRAM7E
	jsl.l SendTextMap
	jsl.l WaitTransfers
	lda.w #$0010
	sta.b $CF
	lda.w #$00F0
	sta.b $D1
	lda.b $79
	bne .1
	ldx.w #TxtGoalies&$FFFF
	bra .2
.1:									; A * 2, X = A, A = LineNames,x, X = A
	asl a
	tax
	lda.l LineNames,x
	tax
.2:									; call UnpackText, push X, X = $4E7D, call UnpackText, ...
	jsl.l UnpackText
	phx
	ldx.w #TxtLine&$FFFF
	jsl.l UnpackText
	ply
	jsr.w ConcatStrings
	ldy.w #$000A
	jsl.l PrintBoldLeftStr
	lda.b $7D
	asl a
	tax
	lda.b $79
	bne .3
	lda.l GoalieRatingNames,x
	bra .4
.3:									; A = RatingNames,x
	lda.l RatingNames,x
.4:									; X = A, call UnpackText, push X, X = $4EC1, ...
	tax
	jsl.l UnpackText
	phx
	ldx.w #TxtStat&$FFFF
	jsl.l UnpackText
	ply
	jsr.w ConcatStrings
	ldy.w #$000B
	jsl.l PrintBoldLeftStr
	lda.w #$000D
	sta.b a2+2
	stz.b a3
	ldx.w #HomeRoster
	lda.b a2
	beq .5
	ldx.w #VisRoster
.5:									; a0 = X, if $79 is not 0 go to ShowRosterLineSlots, d4+2 = $0010
	stx.b a0
	lda.b $79
	bne ShowRosterLineSlots
	lda.w #$0010
	sta.b d4+2
RosterGoalieRowNext:				; ShowRosterLine's goalie rows (line 0): goalie a3's name, then his stat
									; column (RosterColumnTable), returning to RosterGoalieRowDone
	lda.w #$0010
	sta.b $CF
	lda.w #$0028
	sta.b $D1
	ldx.w #TxtG&$FFFF
	ldy.b a2+2
	jsl.l PrintBoldCentred
	lda.b $D1
	sta.b $CF
	lda.w #$00D0
	sta.b $D1
	lda.b a3
	sta.b d0
	asl a
	adc.b a0
	tax
	lda.w $0008,x
	sta.b d0+2
	lda.b a3
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
	lda.w #$00D0
	sta.b $CF
	lda.b $7D
	asl a
	asl a
	tax
	txy
	lda.l GoalieRatingColumns,x
	sta.b d4
	lda.l GoalieRatingColumns+2,x
	tax
	pea.w RosterGoalieRowDone-1
	jmp (RosterColumnTable,x)

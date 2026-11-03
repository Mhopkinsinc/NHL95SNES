ShowRosterLineSlots:				; ShowRosterLine for lines 1 up: the line's five players by slot
									; (positions from PositionNames)
	stz.b d4+2
RosterSlotRowNext:					; a line slot's row: its position text, the player's name, then his stat
									; column (RosterColumnTable), returning to RosterSlotRowDone
	lda.w #$0010
	sta.b $CF
	lda.w #$0028
	sta.b $D1
	lda.b a3
	asl a
	tax
	lda.l PositionNames,x
	tax
	ldy.b a2+2
	jsl.l PrintBoldCentred
	lda.b $D1
	sta.b $CF
	lda.w #$00F0
	sta.b $D1
	lda.b $79
	asl a
	asl a
	asl a
	adc.b a3
	adc.b a0
	inc a
	tax
	lda.w $006C,x
	and.w #$00FF
	dec a
	sta.b d0
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
	lda.w #$00D0
	sta.b $CF
	lda.b $7D
	asl a
	asl a
	tax
	txy
	lda.l RatingColumns,x
	sta.b d4
	lda.l RatingColumns+2,x
	tax
	pea.w RosterSlotRowDone-1
	jmp (RosterColumnTable,x)

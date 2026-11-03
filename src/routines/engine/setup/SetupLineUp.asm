SetupLineUp:						; setup screen up: the line above (d6 - 1); at the top row the list
									; scrolls (SetupScrollUp) and the new line is drawn, else the cursor moves
									; up a row
	lda.b d6
	beq .rts
	dec a
	sta.b d6
	bne .1
	ldx.b a4
	lda.b $22,x
	and.w #$FFFE
	sta.b $22,x
.1:									; call SetupLinePalette3, A = SetupLineRow, A - 1, A - 1, ...
	jsr.w SetupLinePalette3
	lda.w SetupLineRow
	dec a
	dec a
	cmp.w #$0010
	bcs .2
	lda.w #$0018
.2:									; SetupLineRow = A, X = a0, A = $08,x, A - $0010, ...
	sta.w SetupLineRow
	sec
	ldx.b a0
	lda.b $08,x
	sbc.w #$0010
	cmp.w #$008C
	bcs .3
	ldx.b $75
	lda.b $22,x
	ora.w #$0001
	sta.b $22,x
	lda.w #$0002
	sta.b d6+2
	bra DrawSetupLine
.3:									; $08,x = A, call SetupLinePalette0
	sta.b $08,x
	jsr.w SetupLinePalette0
.rts:								; return
	rts

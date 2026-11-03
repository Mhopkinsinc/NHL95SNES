DrawPauseItems:						; blanks the pause item rows (the bank $C3 list of seven blank items) and
									; prints item list A (PrintPauseItems)
	pha
	ldx.w #BlankPauseItems&$FFFF
	jsr.w PrintPauseItems
	plx
PrintPauseItems:					; prints pause item list X (bank $C3: a count to pauseitems, then a
									; routine and a text word an item) into the pause map, an item every two
									; rows from row 12, attribute $3A00
	lda.w #$00C3
	sta.b r0+2
	ldy.w #$0314
	lda.l $C30000,x
	sta.w pauseitems
	sta.b tmp0
PrintPauseItemsRow:					; saves the item and row, then dispatches its callback or reads its text
	phx
	phy
	lda.l $C30002,x
	beq .1
	sta.b r0
	jmp ($002C)
.1:									; A = $C30004,x
	lda.l $C30004,x
PrintPauseItemText:					; prints item text A (bank $C3, length-prefixed; 0 leaves the item out) on
									; the current item row, then the next item; the item routines go on here
	sta.b r0
	cmp.w #$0000
	beq .1
	tya
	clc
	adc.w PauseMapBuf
	tax
	lda.b [r0]
	and.w #$00FF
	tay
.loop:								; loop: r0 + 1, A = [r0], A and $00FF, A or $3A00, ...
	inc.b r0
	lda.b [r0]
	and.w #$00FF
	ora.w #$3A00
	sta.l $7E0000,x
	inx
	inx
	dey
	bne .loop
	lda.w #$0080
	sta.b r0
.1:									; pull A, A + r0, Y = A, pull A, ...
	pla
	clc
	adc.b r0
	tay
	pla
	adc.w #$0004
	tax
	dec.b tmp0
	bne PrintPauseItemsRow
	rts

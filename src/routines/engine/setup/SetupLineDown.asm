SetupLineDown:						; setup screen down: the line below (d6 + 1, below the line count $69); at
									; the bottom row the list scrolls (SetupScrollDown) and the new line is
									; drawn, else the cursor moves down a row
	lda.b d6
	inc a
	cmp.b a1+2
	bcc .1
	jmp.w SetupLineDownReturn
.1:									; d6 = A, A + 1, if A < a1+2 go to .2, if A < $0005 go to .2, ...
	sta.b d6
	inc a
	cmp.b a1+2
	bcc .2
	cmp.w #$0005
	bcc .2
	ldx.b $75
	lda.b $22,x
	and.w #$FFFE
	sta.b $22,x
.2:									; call SetupLinePalette3, A = SetupLineRow, A + 1, A + 1, ...
	jsr.w SetupLinePalette3
	lda.w SetupLineRow
	inc a
	inc a
	cmp.w #$001A
	bcc .3
	lda.w #$0010
.3:									; SetupLineRow = A, X = a0, A = $08,x, A + $0010, ...
	sta.w SetupLineRow
	clc
	ldx.b a0
	lda.b $08,x
	adc.w #$0010
	cmp.w #$00CC
	bcc SetupLineDownPlaceCursor
	ldx.b a4
	lda.b $22,x
	ora.w #$0001
	sta.b $22,x
	lda.w #$0004
	sta.b d6+2
DrawSetupLine:						; draws setup line d6 on its text row (SetupLineRow): the title at the
									; left and the setting centred (right aligned in play mode 7), then
									; SendTextMap
	lda.w SetupLineRow
	xba
	lsr a
	lsr a
	adc.b $D3
	ldy.w #$0080
	jsl.l ClearRAM7E
	lda.w #$0010
	sta.b $CF
	lda.b d6
	asl a
	asl a
	asl a
	adc.b a3
	tax
	phx
	lda.l $C30002,x
	tax
	ldy.w SetupLineRow
	jsl.l PrintItalicLeft
	plx
	lda.w #$0094
	sta.b $CF
	lda.l $C30006,x
	tay
	lda.w $0000,y
	inc a
	asl a
	adc.l $C30004,x
	tax
	lda.l $C30000,x
	tax
	ldy.w SetupLineRow
	lda.w OptPlayMode
	cmp.w #$0007
	bne .1
	jsl.l PrintItalicRight
	bra .2
.1:									; call PrintItalicCentred
	jsl.l PrintItalicCentred
.2:									; call SendTextMap, return
	jsl.l SendTextMap
	rts

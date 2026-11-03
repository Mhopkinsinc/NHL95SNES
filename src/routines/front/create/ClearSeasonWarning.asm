ClearSeasonWarning:					; clears the 10 text rows from row $10 (the season in progress warning),
									; then SendTextMap and WaitTransfers
	clc
	lda.w #$0400
	adc.b $D3
	ldy.w #$0280
	jsl.l ClearRAM7E
	jsl.l SendTextMap
	jsl.l WaitTransfers
	rts

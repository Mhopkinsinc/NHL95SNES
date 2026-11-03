ClearPlayerStatsList:				; clears ShowPlayerStats' list area of the text map ($380 bytes from
									; +$300) and the two header rows above it
	lda.w #$0300
	clc
	adc.b $D3
	pha
	ldy.w #$0380
	jsl.l ClearRAM7E
	jsl.l SendTextMap
	pla
	sec
	sbc.w #$0100
	pha
	ldy.w #$0020
	jsl.l ClearRAM7E
	pla
	clc
	adc.w #$0040
	ldy.w #$0020
	jsl.l ClearRAM7E
	jsl.l WaitTransfers
	rts

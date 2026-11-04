ClearNameField:						; clears 17 tiles from column 15 of row $71 and the row below (the name
									; being entered), then SendTextMap
	lda.b a3+2
	xba
	lsr a
	lsr a
	adc.b $D3
	adc.w #$001E
	pha
	ldy.w #$0022
	phy
	jsl.l ClearRAM7E
	ply
	pla
	clc
	adc.w #$0040
	jsl.l ClearRAM7E
	jsl.l SendTextMap
	rts

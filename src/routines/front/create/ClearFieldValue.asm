ClearFieldValue:					; clears the 16 tiles from column 16 of row A and the row below (a Create
									; Player field's value)
	xba
	lsr a
	lsr a
	adc.b $D3
	adc.w #$0020
	pha
	ldy.w #$0020
	jsl.l ClearRAM7E
	pla
	clc
	adc.w #$0040
	ldy.w #$0020
	jsl.l ClearRAM7E
	rts

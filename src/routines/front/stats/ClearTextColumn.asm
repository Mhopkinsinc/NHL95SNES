ClearTextColumn:					; clears 20 bytes at text map address A and at the same place on each of
									; the next tmp0 rows
	pha
	ldy.w #$0014
	jsl.l ClearRAM7E
	pla
	clc
	adc.w #$0040
	dec.b tmp0
	bpl ClearTextColumn
	rts

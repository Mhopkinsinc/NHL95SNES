ClearLinePlayerStatColumn:			; clears the right half of text row 12 (the list header) and 10 tiles from
									; column 22 on rows 13-24 (the stat column), then sends the map
	lda.b $D3
	clc
	adc.w #$0320
	pha
	ldy.w #$0020
	jsl.l ClearRAM7E
	pla
	clc
	adc.w #$004C
	ldx.w #$000B
.loop:								; loop: push X, push A, Y = $0014, call ClearRAM7E, ...
	phx
	pha
	ldy.w #$0014
	jsl.l ClearRAM7E
	pla
	clc
	adc.w #$0040
	plx
	dex
	bpl .loop
	jsl.l SendTextMap
	jsl.l WaitTransfers
	rts

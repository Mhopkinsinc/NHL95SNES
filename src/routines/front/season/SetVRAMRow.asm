SetVRAMRow:							; with D = $2100: VMADD = Y, then Y one map row on (+ $20, wrapping in
									; $5000-$53FF)
	sty.b $16
	tya
	clc
	adc.w #$0020
	and.w #$03FF
	ora.w #$5000
	tay
	rts

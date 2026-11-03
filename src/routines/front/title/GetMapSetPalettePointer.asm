GetMapSetPalettePointer:			; returns the map set palette data pointer in X:A
	stx.b tmp1
	sta.b tmp0
	clc
	adc.b [tmp0]
	bcc .1
	inx
	clc
.1:									; A + $0002, if carry clear go to .2, X + 1
	adc.w #$0002
	bcc .2
	inx
	clc
.2:									; tmp0 = A, A + [tmp0], if carry clear go to .3, X + 1, ...
	sta.b tmp0
	adc.b [tmp0]
	bcc .3
	inx
	clc
.3:									; A + $0009, if carry clear go to .rts, X + 1
	adc.w #$0009
	bcc .rts
	inx
.rts:								; return
	rts

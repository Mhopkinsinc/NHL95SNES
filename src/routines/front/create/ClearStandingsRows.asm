ClearStandingsRows:					; clears Y bytes of the text map from the standings rows
	lda.w #$01D0
ClearTextMapAt:						; clears Y bytes of the text map from offset A
	clc
	adc.b $D3
	jsl.l ClearRAM7E
	rts

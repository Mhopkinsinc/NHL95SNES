NextMapSetChunkWRAM:				; r2 (bank $36) to the next chunk of the map set: + its length word + 2
	clc
	lda.b [r2]
	adc.b r2
	sta.b r2
	lda.b r2+2
	adc.w #$0000
	sta.b r2+2
	clc
	lda.b r2
	adc.w #$0002
	sta.b r2
	bcc .rts
	inc.b r2+2
.rts:								; return
	rts

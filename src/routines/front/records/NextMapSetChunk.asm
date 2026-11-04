NextMapSetChunk:					; r1 (bank $32) to the next chunk of the map set: + its length word + 2
	clc
	lda.b [r1]
	adc.b r1
	bcc .1
	inc.b r1+2
	clc
.1:									; A + $0002, r1 = A, if carry clear go to .rts, r1+2 + 1
	adc.w #$0002
	sta.b r1
	bcc .rts
	inc.b r1+2
.rts:								; return
	rts

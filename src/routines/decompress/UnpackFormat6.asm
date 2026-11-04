UnpackFormat6:						; format 6: a flag byte per 8 runs or copies, up to 11 bits back
	inc.b r1
	bne .1
	inc.b r1+2
.1:									; A = [r1], A / 2, $0E = A, call UnpackFormat6Step, ...
	lda.b [r1]
	lsr a
	sta.b $0E
	jsr.w UnpackFormat6Step
	lsr.b $0E
	jsr.w UnpackFormat6Step
	lsr.b $0E
	jsr.w UnpackFormat6Step
	lsr.b $0E
	jsr.w UnpackFormat6Step
	lsr.b $0E
	jsr.w UnpackFormat6Step
	lsr.b $0E
	jsr.w UnpackFormat6Step
	lsr.b $0E
	jsr.w UnpackFormat6Step
	lsr.b $0E
	jsr.w UnpackFormat6Step
	bra UnpackFormat6

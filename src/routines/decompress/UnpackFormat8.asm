UnpackFormat8:						; format 8: a flag byte per 8 runs or copies, up to 12 bits back
	inc.b r1
	bne .1
	inc.b r1+2
.1:									; A = [r1], A / 2, $0E = A, call UnpackFormat8Step, ...
	lda.b [r1]
	lsr a
	sta.b $0E
	jsr.w UnpackFormat8Step
	lsr.b $0E
	jsr.w UnpackFormat8Step
	lsr.b $0E
	jsr.w UnpackFormat8Step
	lsr.b $0E
	jsr.w UnpackFormat8Step
	lsr.b $0E
	jsr.w UnpackFormat8Step
	lsr.b $0E
	jsr.w UnpackFormat8Step
	lsr.b $0E
	jsr.w UnpackFormat8Step
	lsr.b $0E
	jsr.w UnpackFormat8Step
	bra UnpackFormat8

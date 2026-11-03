makepde:							; called from other segments
	pha
	pei ($83)
	pei ($6B)
	ldx.b a0
	jsl.l getpde
	pla
	sta.b a2
	pla
	sta.b d1
	pla
	ldx.b d0
	jsl.l Mul16S
	lda.b r2+2
	asl.b r2
	rol a
	asl.b r2
	rol a
	asl.b r2
	rol a
	asl.b r2
	rol a
	sta.b d0
	ldx.b a3
	clc
	rtl

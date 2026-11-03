InitCrowdExcite:					; initialize crowd excitement at a period start except overtime
	lda.w gsp
	cmp.w #$0003
	beq .rtl
	stz.b r0
	lda.w OptPlayMode
	cmp.w #$0003
	bne .1
	inc.b r0
.1:									; A = r0, A * 2, A * 2, A * 2, ...
	lda.b r0
	asl a
	asl a
	asl a
	asl a
	sta.w CwdExciteLvl
.rtl:								; return
	rtl

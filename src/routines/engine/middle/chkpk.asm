chkpk:								; return zero if player X is killing a penalty
	lda.w sflags
	and.w #$2000
	bne chkpk2
	inc a
	rtl

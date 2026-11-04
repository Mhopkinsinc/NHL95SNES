chkpk2:								; from chkpk, assnearest and other segments
	lda.w pfteam,x
	bne .1
	lda.w sflags
	and.w #$4000
	eor.w #$4000
	rtl
.1:									; A = sflags, A and $4000, return
	lda.w sflags
	and.w #$4000
	rtl

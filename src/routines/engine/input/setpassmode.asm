setpassmode:						; called from other segments
	lda.w position,x
	bne .2
	lda.w puckx
	cmp.w #$FFF0
	bmi .2
	cmp.w #$0010
	bpl .2
	lda.w pucky
	cmp.w #$010E
	bpl .1
	cmp.w #$FEF2
	bpl .2
.1:									; if A < $0116 go to .rtl
	cmp.w #$0116
	bcc .rtl
.2:									; A = facedir,x, A and $0007, passdir = A, A = $0004, ...
	lda.w facedir,x
	and.w #$0007
	sta.w passdir
	lda.w #$0004
	tsb.w sflags
.rtl:								; return
	rtl

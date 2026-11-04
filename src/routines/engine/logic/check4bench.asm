check4bench:						; from assbench and other segments
	lda.w pflags,x
	bit.w #$4000
	bne .rtl
	lda.w newpos,x
	bpl .1
	lda.w newpnum,x
	bmi .rtl
.1:									; if newpnum,x = pnum,x go to .2, if asscur,x = $000C go to .rtl, ...
	lda.w newpnum,x
	cmp.w pnum,x
	beq .2
	lda.w asscur,x
	cmp.w #$000C
	beq .rtl
	cpx.w puckc
	beq .rtl
	sep #$20
	pla
	rep #$30
	pla
	lda.w pflags,x
	ora.w #$1000
	sta.w pflags,x
	stz.w temp1,x
	lda.w #$000C
	sta.b d0
	jml.l assreplace
.rtl:								; return
	rtl
.2:									; A 8-bit, pull A, A, X / Y 16-bit, pull A, ...
	sep #$20
	pla
	rep #$30
	pla
	lda.w pflags,x
	and.w #$EFFF
	sta.w pflags,x
	stz.w pfnc,x
	lda.w #$FFFF
	sta.w newpnum,x
	sta.w newpos,x
	lda.w position,x
	sta.b d0
	jmp.w Setplass

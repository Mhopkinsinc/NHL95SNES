asseben:							; asstab entry 10: an assignment routine
	lda.w pfalock,x
	bne .rtl
	lda.w pflags,x
	bit.w #$0002
	beq .2
	and.w #$FFFD
	sta.w pflags,x
	stz.w Xvel,x
	stz.w Yvel,x
	stz.w goalieflags,x
	txa
	lsr a
	sec
	sbc.w #$0006
	bmi .1
	inc a
.1:									; push X, X = A, A = $000E, call Mul16x8XS, ...
	phx
	tax
	lda.w #$000E
	jsl.l Mul16x8XS
	plx
	lda.b r2
	sta.w Ypos,x
	lda.w attribute,x
	ora.w #$0800
	sta.w attribute,x
	lda.w #$FF65
	sta.w Xpos,x
	lda.w #$0002
	sta.w facedir,x
	sta.w pfalock,x
	lda.w #SPAwallout&$FFFF
	jml.l SetSPAUpdate
.rtl:								; return
	rtl
.2:									; facedir,x = $0004, A = pflags,x, A and $6FFF, pflags,x = A, ...
	lda.w #$0004
	sta.w facedir,x
	lda.w pflags,x
	and.w #$6FFF
	sta.w pflags,x
	stz.w pfnc,x
	stz.w SPA,x
	lda.w #$1000
	sta.w Xvel,x
	lda.w handed,x
	beq .3
	lda.w attribute,x
	and.w #$F7FF
	sta.w attribute,x
.3:									; go to assexit
	jml.l assexit

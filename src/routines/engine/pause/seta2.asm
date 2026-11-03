seta2:								; a2 = the team of the pad that paused (0 home, 2 visitors), from its
									; entry in cont1team
	stz.b a2
	ldx.w pausepad
	bpl .1
	txa
	eor.w #$FFFF
	inc a
	ldx.w #$0008
.loop:								; loop: if A = cont1team,x go to .1, X - 1, X - 1, ...
	cmp.w cont1team,x
	beq .1
	dex
	dex
	bpl .loop
	rtl
.1:									; if $0002 is not cont1team,x go to .rtl, a2 = A
	lda.w #$0002
	cmp.w cont1team,x
	bne .rtl
	sta.b a2
.rtl:								; return
	rtl

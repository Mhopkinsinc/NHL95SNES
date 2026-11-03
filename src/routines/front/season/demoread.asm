demoread:							; from Gameloop and other segments
	lda.w OptPlayMode
	cmp.w #$0004
	bne .3
	lda.w cont1team
	ora.w cont2team
	ora.w cont3team
	ora.w cont4team
	ora.w cont5team
	beq .3
	ldx.w #$0000
.1:									; push X, if cont1team,x = 0 go to .2, A = X, A / 2, ...
	phx
	lda.w cont1team,x
	beq .2
	txa
	lsr a
	jsl.l ReadjoyA
	lda.b d3
	bit.w #$1000
	beq .2
	pla
	jmp.w PauseFromPad
.2:									; pull X, X + 1, X + 1, if X < $000A go to .1, ...
	plx
	inx
	inx
	cpx.w #$000A
	bcc .1
	rtl
.3:									; A = cont1team, A or cont2team, A or cont3team, A or cont4team, ...
	lda.w cont1team
	ora.w cont2team
	ora.w cont3team
	ora.w cont4team
	ora.w cont5team
	bne .rtl
	jsl.l ReadJoy1
	lda.b d1
	bit.w #$1000
	beq .4
	jmp.w startpause1
.4:									; if d1 is not 0 go to .5
	lda.b d1
	bne .5
.rtl:								; return
	rtl
.5:									; fadestep = 0, go to Restart
	stz.w fadestep
	jml.l Restart

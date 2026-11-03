PuckCarrierThink:					; update the computer puck carrier decisions and skating target
	lda.w gmclock
	bne PuckCarrierGlideStopped
	lda.w pflags,x
	bit.w #$0002
	beq .1
	and.w #$FFFD
	sta.w pflags,x
	stz.w temp1,x
	stz.w temp2,x
	lda.w #$0008
	sta.w temp2b,x
	lda.w seed
	and.w #$0003
	sta.w temp3,x
.1:									; A = temp1,x, A - d7, temp1,x = A, if plus go to .5, ...
	lda.w temp1,x
	sec
	sbc.b d7
	sta.w temp1,x
	bpl .5
	adc.w aioff,x
	bpl .2
	lda.w #$0000
.2:									; temp1,x = A, call checkob, if breakaway = 0 go to .4, d0 = Ypos,x, ...
	sta.w temp1,x
	jsl.l checkob
	lda.w breakaway
	beq .4
	lda.w Ypos,x
	sta.b d0
	bpl .3
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
.3:									; if A - $0096 >= 0 go to .4, d0 = $0010, call assreplace, go to .rtl
	cmp.w #$0096
	bpl .4
	lda.w #$0010
	sta.b d0
	jsl.l assreplace
	bra .rtl
.4:									; call chk4lc, call chk4shot, if asscur,x is not $0011 go to .5, ...
	jsl.l chk4lc
	jsl.l chk4shot
	lda.w asscur,x
	cmp.w #$0011
	bne .5
	jsl.l chk4pass
.5:									; A = $0006, A + temp3,x, d0 = A, a0+2 = asspuckc_postab>>16, ...
	lda.w #$0006
	clc
	adc.w temp3,x
	sta.b d0
	lda.w #asspuckc_postab>>16
	sta.b a0+2
	lda.w #asspuckc_postab&$FFFF
	sta.b a0
	lda.w sflags
	bit.w #$8000
	beq .6
	lda.w position,x
	sta.b d0
.6:									; A = d0, A * 2, A * 2, Y = A, ...
	lda.b d0
	asl a
	asl a
	tay
	lda.b [a0],y
	sta.b d0
	iny
	iny
	lda.b [a0],y
	sta.b d1
	lda.w pfgoal,x
	bne .7
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
.7:									; a0+2 = PuckCarrierAvoidThreats>>16, a0 = PuckCarrierAvoidThreats, ...
									; skateto
	lda.w #PuckCarrierAvoidThreats>>16
	sta.b a0+2
	lda.w #PuckCarrierAvoidThreats
	sta.b a0
	jml.l skateto
.rtl:								; return
	rtl

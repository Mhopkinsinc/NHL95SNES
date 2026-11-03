pucknorm:							; assignment (asstab entry 24): the puck most of the time; a new
									; assignment clears its timers, then pucknorm_move
	lda.w #$0002
	trb.w pflags+$1C
	beq pucknorm_move
	stz.w temp1+$1C
	stz.w temp2+$1C
	lda.w #$0078
	sta.w temp2b+$1C
	stz.w pspuckback
pucknorm_move:						; from pucknorm and other segments
	lda.w puckcross+2
	sec
	sbc.b d7
	sta.w puckcross+2
	lda.w puckcross+6
	sec
	sbc.b d7
	sta.w puckcross+6
	lda.w temp1+$1C
	sec
	sbc.b d7
	sta.w temp1+$1C
	bpl .1
	adc.w #$0005
	sta.w temp1+$1C
	jsl.l UpdatePuckGoalCrossings
.1:									; if puckc < 0 go to .4, a2 = A, call a2touchpuck, A = a2, ...
	lda.w puckc
	bmi .4
	sta.b a2
	jsl.l a2touchpuck
	lda.b a2
	jsl.l GetFrameHot
	ldy.b a2
	lda.b d0
	clc
	adc.w Xpos,y
	sec
	sbc.w puckx
	lsr a
	lsr a
	bit.w #$2000
	beq .2
	ora.w #$C000
.2:									; A + puckx, puckx = A, A = d1, A + Ypos,y, ...
	clc
	adc.w puckx
	sta.w puckx
	lda.b d1
	clc
	adc.w Ypos,y
	sec
	sbc.w pucky
	lsr a
	lsr a
	bit.w #$2000
	beq .3
	ora.w #$C000
.3:									; A + pucky, pucky = A, puckvx = Xvel,y, puckvy = Yvel,y
	clc
	adc.w pucky
	sta.w pucky
	lda.w Xvel,y
	sta.w puckvx
	lda.w Yvel,y
	sta.w puckvy
.4:									; call PuckIChk, call ChkOffsides, if gmclock is not 0 go to .13, ...
	jsl.l PuckIChk
	jsl.l ChkOffsides
	lda.w gmclock
	bne .13
	lda.w puckc
	bpl .11
	lda.w PenShotActive
	beq .9
	lda.w gmode
	bit.w #$0002
	bne .5
	lda.w BA_Team
	beq .7
	bra .6
.5:									; if BA_Team is not 0 go to .7
	lda.w BA_Team
	bne .7
.6:									; if puckvy < 0 go to .9, go to .8
	lda.w puckvy
	bmi .9
	bra .8
.7:									; A = puckvy, A - 1, if the result >= 0 go to .9
	lda.w puckvy
	dec a
	bpl .9
.8:									; A = pspuckback, A + 1, pspuckback = A, if A < $0030 go to .10, ...
	lda.w pspuckback
	inc a
	sta.w pspuckback
	cmp.w #$0030
	bcc .10
	jsl.l EndPenaltyShot
.9:									; pspuckback = 0
	stz.w pspuckback
.10:								; if puckx is not OldXpos+$1C go to .12, ...
	lda.w puckx
	cmp.w OldXpos+$1C
	bne .12
	lda.w pucky
	cmp.w OldYpos+$1C
	bne .12
	lda.w #$0006
	sta.b d0
	dec.w temp2b+$1C
	bpl .13
	jsl.l AddPenalty2
	bra .13
.11:								; pspuckback = 0
	stz.w pspuckback
.12:								; temp2b+$1C = $0078
	lda.w #$0078
	sta.w temp2b+$1C
.13:								; A = puckvz, A and $FF00, if the result = 0 go to .14, ...
	lda.w puckvz
	and.w #$FF00
	ora.w puckz
	beq .14
	jmp.w checkpuckcoll
.14:								; call pucknothing, go to checkpuckcoll
	jsl.l pucknothing
	jmp.w checkpuckcoll

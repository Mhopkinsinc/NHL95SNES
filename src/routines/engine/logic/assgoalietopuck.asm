assgoalietopuck:					; called from other segments
	lda.w #$0006
	ora.w goalieflags,x
	sta.w goalieflags,x
	lda.w Xpos,x
	cmp.w #$FFD8
	bmi .2
	cmp.w #$0029
	bpl .2
	lda.w Ypos,x
	bit.w #$8000
	beq .1
	eor.w #$FFFF
	inc a
.1:									; r0 = A, if A - $00EB < 0 go to .2, if A - $010A >= 0 go to .2, ...
	sta.b r0
	cmp.w #$00EB
	bmi .2
	cmp.w #$010A
	bpl .2
	lda.w #$FFFB
	and.w goalieflags,x
	sta.w goalieflags,x
.2:									; if Xpos,x - $FFD0 < 0 go to .4, if Xpos,x - $0031 >= 0 go to .4, ...
	lda.w Xpos,x
	cmp.w #$FFD0
	bmi .4
	cmp.w #$0031
	bpl .4
	lda.w Ypos,x
	bit.w #$8000
	beq .3
	eor.w #$FFFF
	inc a
.3:									; if A - $00EB < 0 go to .4, A = $FFFD, A and goalieflags,x, ...
	cmp.w #$00EB
	bmi .4
	lda.w #$FFFD
	and.w goalieflags,x
	sta.w goalieflags,x
.4:									; if playerpad,x >= 0 go to .6, if gmclock is not 0 go to .6, ...
	lda.w playerpad,x
	bpl .6
	lda.w gmclock
	bne .6
	jsl.l check4bench
	lda.w pflags,x
	bit.w #$0002
	beq .5
	and.w #$FFFD
	sta.w pflags,x
	stz.w temp1,x
	stz.w GoalieUnused
.5:									; A = temp1,x, A - d7, temp1,x = A, if plus go to .10, ...
	lda.w temp1,x
	sec
	sbc.b d7
	sta.w temp1,x
	bpl .10
	lda.w aidef,x
	lsr a
	lsr a
	clc
	adc.w temp1,x
	bpl .7
	lda.w #$0000
	bra .7
.6:									; go to assexit
	jmp.w assexit
.7:									; temp1,x = A, if puckc >= 0 go to .6, A = puckvy, ...
	sta.w temp1,x
	lda.w puckc
	bpl .6
	lda.w puckvy
	ldy.w pfgoal,x
	beq .8
	eor.w #$FFFF
	inc a
.8:									; if A - $F800 < 0 go to .6, a1 = 0, a2 = $0002, ...
	cmp.w #$F800
	bmi .6
	stz.b a1
	lda.w #$0002
	sta.b a2
	lda.w pfteam,x
	beq .9
	stz.b a2
	lda.w #$0002
	sta.b a1
.9:									; Y = a2, if tmnear,y < $0046 go to .6
	ldy.b a2
	lda.w tmnear,y
	cmp.w #$0046
	bcc .6
.10:								; call GoaliePuckVector, call vtoa, call AdjustFacingDirection, ...
	jsr.w GoaliePuckVector
	jsl.l vtoa
	jsl.l AdjustFacingDirection
	asl.w legstr,x
	jsl.l GoalieChasePuck
	lsr.w legstr,x
	rtl

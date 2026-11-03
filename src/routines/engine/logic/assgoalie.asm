assgoalie:							; assignment (asstab entry 7): the goalie
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
.3:									; r0 = A, if A - $00EB < 0 go to .4, A = $FFFD, A and goalieflags,x, ...
	sta.b r0
	cmp.w #$00EB
	bmi .4
	lda.w #$FFFD
	and.w goalieflags,x
	sta.w goalieflags,x
.4:									; call check4bench, A = pflags,x, if $0002 bits clear go to .5, ...
	jsl.l check4bench
	lda.w pflags,x
	bit.w #$0002
	beq .5
	and.w #$FFFD
	sta.w pflags,x
	stz.w temp1,x
	stz.w temp2,x
	lda.w #$0008
	sta.w temp2b,x
	lda.w #$FFFF
	sta.w temp4,x
.5:									; if playerpad,x >= 0 go to GoalieCheckManualState, ...
	ldy.w playerpad,x
	bpl GoalieCheckManualState
	lda.w Xpos,x
	cmp.w #$FFCB
	bmi .7
	cmp.w #$0035
	bpl .7
	lda.w Ypos,x
	bit.w #$8000
	beq .6
	eor.w #$FFFF
	inc a
.6:									; if A >= $0115 go to .7, if A >= $00D9 go to GoalieUpdateStateJump
	cmp.w #$0115
	bcs .7
	cmp.w #$00D9
	bcs GoalieUpdateStateJump
.7:									; a0+2 = rtss>>16, a0 = rtss, Y = $0004, if Xpos,x >= 0 go to .8, ...
	lda.w #rtss>>16
	sta.b a0+2
	lda.w #rtss
	sta.b a0
	ldy.w #$0004
	lda.w Xpos,x
	bpl .8
	ldy.w #$FFFC
.8:									; d0 = Y, d1 = $00FA, if pfgoal,x = 0 go to .9, d1 = $FF06
	sty.b d0
	lda.w #$00FA
	sta.b d1
	lda.w pfgoal,x
	beq .9
	lda.w #$FF06
	sta.b d1
.9:									; go to skateto
	jml.l skateto
	rtl								; unreached: no code branches, falls or points here

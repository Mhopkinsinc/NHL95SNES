OffensiveDefenceThink:				; update computer offensive defender movement
	lda.w gmclock
	beq .1
	jmp.w donothing
.1:									; call check4bench, if playerpad,x >= 0 go to OffensiveDefenceReturn, ...
	jsl.l check4bench
	lda.w playerpad,x
	bpl OffensiveDefenceReturn
	lda.w pflags,x
	bit.w #$0002
	beq .2
	and.w #$FFFD
	sta.w pflags,x
	stz.w temp1,x
	stz.w temp2,x
	lda.w #$0008
	sta.w temp2b,x
.2:									; A = temp1,x, A - d7, temp1,x = A, if plus go to .4, ...
	lda.w temp1,x
	sec
	sbc.b d7
	sta.w temp1,x
	bpl .4
	clc
	adc.w aioff,x
	bpl .3
	lda.w #$0000
.3:									; temp1,x = A
	sta.w temp1,x
.4:									; a0+2 = EvadePC>>16, a0 = EvadePC, Y = $0050, ...
	lda.w #EvadePC>>16
	sta.b a0+2
	lda.w #EvadePC
	sta.b a0
	ldy.w #$0050
	lda.w position,x
	cmp.w #$0002
	beq .5
	ldy.w #$FFB0
.5:									; if pfgoal,x is not 0 go to .6, A = Y, A xor $FFFF, A + 1, ...
	lda.w pfgoal,x
	bne .6
	tya
	eor.w #$FFFF
	inc a
	tay
.6:									; d0 = Y, A = puckx, if the result < 0 go to OffensiveDefenceBlendX, A =
									; puckx, ...
	sty.b d0
	lda.w puckx
	eor.b d0
	bmi OffensiveDefenceBlendX
	lda.w puckx
	bra OffensiveDefenceTargetY
	rtl								; unreached: no code branches, falls or points here

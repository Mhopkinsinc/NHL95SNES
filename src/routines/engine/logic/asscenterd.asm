asscenterd:							; called from other segments
	ldy.w puckc
	bmi .2
	lda.w pfteam,x
	cmp.w pfteam,y
	bne .2
	lda.w #$0006
	sta.b d0
	jmp.w assreplace
.rtl:								; return
	rtl
.1:									; go to donothing
	jmp.w donothing
.2:									; if gmclock is not 0 go to .1, call check4bench, ...
	lda.w gmclock
	bne .1
	jsl.l check4bench
	lda.w playerpad,x
	bpl .rtl
	lda.w pflags,x
	bit.w #$0002
	beq .3
	and.w #$FFFD
	sta.w pflags,x
	stz.w temp1,x
	stz.w temp2,x
	lda.w #$0008
	sta.w temp2b,x
.3:									; A = temp1,x, A - d7, temp1,x = A, if plus go to .4, ...
	lda.w temp1,x
	sec
	sbc.b d7
	sta.w temp1,x
	bpl .4
	lda.w aidef,x
	sta.w temp1,x
.4:									; A = puckx, push A, A * 2, pull A, ...
	lda.w puckx
	pha
	asl a
	pla
	ror a
	sta.b d0
	lda.w #$0084
	sta.b d1
	lda.w pfgoal,x
	beq CenterDefenceTopTarget
	lda.w #$FF7C
	sta.b d1
	lda.w #$FFA4
	sec
	sbc.w pucky
	bpl CenterDefenceSkate
	lda.w #$FF7C
	clc
	adc.w pucky
	pha
	asl a
	pla
	ror a
	sta.b d1
	bra CenterDefenceSkate
	rtl								; unreached: no code branches, falls or points here

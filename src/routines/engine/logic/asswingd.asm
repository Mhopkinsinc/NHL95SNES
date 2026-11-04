asswingd:							; called from other segments
	ldy.w puckc
	bmi .2
	lda.w pfteam,x
	cmp.w pfteam,y
	bne .2
	lda.w #$0004
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
.3:									; A = temp1,x, A - d7, temp1,x = A, if plus go to .5, ...
	lda.w temp1,x
	sec
	sbc.b d7
	sta.w temp1,x
	bpl .5
	clc
	adc.w aidef,x
	bpl .4
	lda.w #$0000
.4:									; temp1,x = A
	sta.w temp1,x
.5:									; d0 = $0064, if position,x is not $0005 go to .6, d0 = $FF9C
	lda.w #$0064
	sta.b d0
	lda.w position,x
	cmp.w #$0005
	bne .6
	lda.w #$FF9C
	sta.b d0
.6:									; Y = puckc, if pfgoal,x = 0 go to DefensiveWingTopTarget, A = $0000, A -
									; d0, ...
	ldy.w puckc
	lda.w pfgoal,x
	beq DefensiveWingTopTarget
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
	lda.w #$FF5E
	sta.b d1
	lda.w #$FFAE
	sta.b d2
	lda.w position,y
	beq DefensiveWingUseLimit
	ldy.b a2
	lda.w tmflags,y
	bit.w #$0010
	bne DefensiveWingUseLimit
	lda.b d2
	sec
	sbc.w pucky
	bpl DefensiveWingBottomLimit
	lda.w pucky
	sta.b d1
	bra DefensiveWingSkate
	rtl								; unreached: no code branches, falls or points here

assscore:							; assignment (asstab entry 8): celebrate a goal
	lda.w gmode
	bit.w #$0040
	beq .1
	lda.b a2
	inc a
	inc a
	jsl.l StartBenchCheer
.1:									; if playerpad,x < 0 go to .2, A = PadRaw1,y, ...
	ldy.w playerpad,x
	bmi .2
	lda.w PadRaw1,y
	and.w #$FFF0
	beq .2
	rtl
.2:									; A = Xvel,x, X = A, A = $00C0, call Mul16x8XS, ...
	lda.w Xvel,x
	tax
	lda.w #$00C0
	jsl.l Mul16x8XS
	ldx.b a3
	lda.b $35
	sta.w Xvel,x
	lda.w Yvel,x
	tax
	lda.w #$00C0
	jsl.l Mul16x8XS
	ldx.b a3
	lda.b $35
	sta.w Yvel,x
	txa
	lsr a
	cmp.w puckc
	bne .3
	lda.w #$FFFF
	sta.w puckc
	lda.w #$0708
	sta.w nopuck,x
.3:									; A = pflags,x, if $0002 bits clear go to .5, A and $FFFD, ...
	lda.w pflags,x
	bit.w #$0002
	beq .5
	and.w #$FFFD
	sta.w pflags,x
	jsl.l ResetCelebrationTimer
	stz.w temp2,x
	lda.w #$0008
	sta.w temp2b,x
	lda.w #$005A
	sta.w temp3,x
	lda.b Hpos
	bpl .4
	lda.w #$FFA6
	sta.w temp3,x
.4:									; temp4,x = Vpos
	lda.b Vpos
	sta.w temp4,x
.5:									; a0+2 = rtss>>16, a0 = rtss&$FFFF, d0 = temp3,x, d1 = temp4,x, ...
	lda.w #rtss>>16
	sta.b a0+2
	lda.w #rtss&$FFFF
	sta.b a0
	lda.w temp3,x
	sta.b d0
	lda.w temp4,x
	sta.b d1
	lda.w temp1,x
	sec
	sbc.b d7
	sta.w temp1,x
	bpl CelebrationSkate
	lda.w #SPAcelebrate&$FFFF
	sta.b d1
	sta.w pfalock,x
	cpx.w shotplayer
	bne .6
	lda.w #SPApump2&$FFFF
	sta.b d1
	lda.w #$FFFF
	sta.w shotplayer
.6:									; call SetSPA
	jsl.l SetSPA
ResetCelebrationTimer:				; temp1 of player X = a random 0-119 (the goal celebration's wait)
	lda.w #$0078
	jsl.l randoma8
	sta.w temp1,x
	rtl

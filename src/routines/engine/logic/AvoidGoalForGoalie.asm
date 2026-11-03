AvoidGoalForGoalie:					; adjust a goalie skating target to avoid the net
	ldx.w #$0108
	ldy.w #$0122
	jsr.w ClassifyGoalieGoalPath
	ldx.w #$0107
	ldy.w #$0123
	stx.b r3
	sty.b $42
	lda.b tmp2
	bne .1
	ldx.w #$FEDE
	ldy.w #$FEF8
	jsr.w ClassifyGoalieGoalPath
	ldx.w #$FEDD
	ldy.w #$FEF9
	stx.b r3
	sty.b $42
	lda.b tmp2
	bne .3
	ldx.b curobj
	rtl
.1:									; A = r3, r3 = $42, $42 = A, A = p0+2, ...
	lda.b r3
	ldy.b $42
	sty.b r3
	sta.b $42
	lda.b p0+2
	eor.w #$FFFF
	inc a
	sta.b p0+2
	lda.b p1+2
	eor.w #$FFFF
	inc a
	sta.b p1+2
	lda.b tmp0
	bit.w #$000A
	beq .2
	eor.w #$000A
	sta.b tmp0
.2:									; A = tmp1, if $000A bits clear go to .3, A xor $000A, tmp1 = A
	lda.b tmp1
	bit.w #$000A
	beq .3
	eor.w #$000A
	sta.b tmp1
.3:									; if tmp1 = 0 go to .4, X = tmp0, call (GoalieAvoidHandlers,x), ...
	lda.b tmp1
	beq .4
	ldx.b tmp0
	jsr (GoalieAvoidHandlers,x)
	ldx.b curobj
	rtl
.4:									; call GoalieAvoidInsideTarget, X = curobj, return
	jsr.w GoalieAvoidInsideTarget
	ldx.b curobj
	rtl

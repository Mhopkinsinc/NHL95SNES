GoalieAvoidInsideTarget:			; route a goalie whose target is inside the avoidance box
	ldx.b curobj
	lda.b p0+2
	cmp.w #$FEF2
	bpl .1
	lda.b p1+2
	cmp.w #$FEF2
	bmi .rts
	bra GoalieAvoidFromBehind
.1:									; if p1+2 - $FEF2 >= 0 go to .rts, go to GoalieAvoidFarBoundary
	lda.b p1+2
	cmp.w #$FEF2
	bpl .rts
	bra GoalieAvoidFarBoundary
.rts:								; return
	rts
.2:									; no caller found: if A < Xpos,y, d1 = $42, return
	cmp.w Xpos,y
	bpl GoalieAvoidReturn
	lda.b $42
	sta.b d1
	rts

ShowGoalBox:						; the goal box after a goal: both line change boxes closed (CloseLCBoxes),
									; then the last ScoreSum entry with the scorer and the assists
	pei ($6D)
	pei ($6B)
	pei ($71)
	pei ($6F)
	inc.w LCBoxesClosed
	lda.w #$FFFF
	sta.w lcpad
	sta.w lcpad+2
	jsl.l CloseLCBoxes
	lda.w ScoreSumbytes
	sec
	sbc.w #$0006
	sta.b a2+2
	tax
	ldy.w #$0004
	lda.w ScoreSum+4,x
	bit.w #$0080
	bne .1
	iny
	iny
	lda.w ScoreSum+5,x
	bit.w #$0080
	bne .1
	iny
.1:									; X = $0013, A = $584C, call Framer, Y = $0000, ...
	ldx.w #$0013
	lda.w #$584C
	jsl.l Framer
	ldy.w #$0000
	ldx.b a2+2
	lda.w ScoreSum+2,x
	bit.w #$0080
	beq .2
	ldy.w #$001A
.2:									; a2 = Y, A = $203D,x, A and $00FF, A + a2, ...
	sty.b a2
	lda.w ScoreSum+3,x
	and.w #$00FF
	clc
	adc.b a2
	tay
	lda.w #HomeRoster
	ldx.b a2
	beq .3
	lda.w #VisRoster
.3:									; a2 = A, A = tmgoals,y, A and $00FF, if A is not $0003 go to .4, ...
	sta.b a2
	lda.w tmgoals,y
	and.w #$00FF
	cmp.w #$0003
	bne .4
	ldx.w #$00C3
	lda.w #$5A26
	ldy.w #$5870
	jsl.l QueueVRAMDMALen
	bra .5
.4:									; X = $00C3, A = $5A31, Y = $5872, call QueueVRAMDMALen
	ldx.w #$00C3
	lda.w #$5A31
	ldy.w #$5872
	jsl.l QueueVRAMDMALen
.5:									; a3 = $58AD, A = a2, A + $0110, a2 = A, ...
	lda.w #$58AD
	sta.b a3
	lda.b a2
	clc
	adc.w #$0110
	sta.b a2
	ldx.b a2+2
	lda.w ScoreSum+3,x
	and.w #$00FF
	jsr.w GoalBoxPlayer
	ldx.b a2+2
	lda.w ScoreSum+4,x
	bit.w #$0080
	bne .6
	pha
	lda.b a3
	tay
	clc
	adc.w #$0020
	sta.b a3
	ldx.w #$00C3
	lda.w #$5A36
	jsl.l QueueVRAMDMALen
	pla
	and.w #$00FF
	jsr.w GoalBoxPlayer
	ldx.b a2+2
	lda.w ScoreSum+5,x
	bit.w #$0080
	bne .6
	and.w #$00FF
	jsr.w GoalBoxPlayer
.6:									; pull A, a3 = A, X = A, pull A, ...
	pla
	sta.b a3
	tax
	pla
	sta.b a3+2
	pla
	sta.b a2
	pla
	sta.b a2+2
	rtl

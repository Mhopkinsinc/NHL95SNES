ShowScoringLeaders:					; display the three leading scorers with their team and player names
	lda.w OptPlayMode
	cmp.w #$0001
	bne .1
	rtl
.1:									; push X, push Y, ScoringLeaders = $FFFF, ScoringLeaders+$2 = A
	phx
	phy
	pei ($81)
	pei ($7F)
	pei ($65)
	pei ($63)
	pei ($69)
	pei ($67)
	pei ($6D)
	pei ($6B)
	lda.w #$FFFF
	sta.w ScoringLeaders
	sta.w ScoringLeaders+$2
	sta.w ScoringLeaders+$4
	jsr.w FindScoringLeaders
	ldy.w gsp
	lda.w #$584C
	cpy.w #$0003
	bne .2
	ldy.w gameclock
	beq .2
	lda.w #$59AC
.2:									; X = $0013, Y = $0005, call Framer, A = gsp, ...
	ldx.w #$0013
	ldy.w #$0005
	jsl.l Framer
	lda.w gsp
	ldy.w #$586D
	cmp.w #$0003
	bne .3
	lda.w gameclock
	beq .3
	ldy.w #$59CD
.3:									; X = $00C3, A = $5A14, call QueueVRAMDMALen, A = $588D, ...
	ldx.w #$00C3
	lda.w #$5A14
	jsl.l QueueVRAMDMALen
	lda.w #$588D
	ldy.w gsp
	cpy.w #$0003
	bne .4
	ldy.w gameclock
	beq .4
	lda.w #$59ED
.4:									; a0 = A, if ScoringLeaders < 0 go to .5, call PrintScoringLeader, ...
	sta.b a0
	ldx.w ScoringLeaders
	bmi .5
	jsr.w PrintScoringLeader
	ldx.w ScoringLeaders+$2
	bmi .5
	jsr.w PrintScoringLeader
	ldx.w ScoringLeaders+$4
	bmi .5
	jsr.w PrintScoringLeader
.5:									; pull A, a2 = A, pull A, a2+2 = A, ...
	pla
	sta.b a2
	pla
	sta.b a2+2
	pla
	sta.b a1
	pla
	sta.b a1+2
	pla
	sta.b a0
	pla
	sta.b a0+2
	pla
	sta.b d0
	pla
	sta.b d0+2
	ply
	plx
	rtl

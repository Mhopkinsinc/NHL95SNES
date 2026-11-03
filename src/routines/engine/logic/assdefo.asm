assdefo:							; called from other segments
	cpx.w puckc
	beq DefenceTakePuckAssignment
	ldy.w puckc
	bmi OffensiveDefenceThink
	lda.w pfteam,x
	cmp.w pfteam,y
	beq OffensiveDefenceThink
	lda.w #$0002
	sta.b d0
	jmp.w assreplace

UpdateTeamLogos:					; setup screen state 0 (SetupScreenStates): replaces the home logo sprite
									; (d7) or the visiting one ($9D) at the same place when HomeTeam or
									; VisTeam has changed, its colours queued
	ldx.b d7
	lda.w HomeTeam
	cmp.b $24,x
	beq .1
	lda.b $05,x
	sta.b $18
	lda.b $08,x
	sta.b $1A
	jsl.l DeleteSprite
	lda.w HomeTeam
	jsl.l CreateSprite
	stx.b d7
	jsr.w QueueHomePalette
.1:									; X = d7+2, if VisTeam = $24,x go to .rts, $18 = $05,x, $1A = $08,x, ...
	ldx.b d7+2
	lda.w VisTeam
	cmp.b $24,x
	beq .rts
	lda.b $05,x
	sta.b $18
	lda.b $08,x
	sta.b $1A
	jsl.l DeleteSprite
	lda.w VisTeam
	jsl.l CreateSprite
	stx.b d7+2
	lda.w #$0001
	sta.b $38,x
	jsr.w QueueVisPalette
.rts:								; return
	rts

SetupPlayoffs:						; starts the playoffs once the schedule has no more games: the marks
									; cleared and the 16 playoff teams chosen into the list at SRPOTeams
									; (once, while it is empty)
	lda.l SRPOTeams
	bne .rtl
	lda.w #BracketSeriesMarks&$FFFF
	ldy.w #$0078
	jsl.l ClearRAM7E
	jsl.l RestoreWorkBuf
	jsl.l BuildAllTeamRecords
	lda.w #$0002
	sta.b tmp0
	jsr.w RankPlayoffConference
	jsr.w GetTopPlayoffSeedMask
	ldx.w #$0004
	bit.w #$0004
	bne .1
	ldx.w #$0008
.1:									; tmp0 = X, call FindPlayoffDivisionSeed, call SwapPlayoffSecondSeed, ...
	stx.b tmp0
	jsr.w FindPlayoffDivisionSeed
	jsr.w SwapPlayoffSecondSeed
	lda.w #$75A4
	sta.b r0
	lda.w #$0030
	sta.b r0+2
	jsr.w StorePlayoffSeeds
	lda.w #$0001
	sta.b tmp0
	jsr.w RankPlayoffConference
	jsr.w GetTopPlayoffSeedMask
	ldx.w #$0010
	bit.w #$0010
	bne .2
	ldx.w #$0020
.2:									; tmp0 = X, call FindPlayoffDivisionSeed, call SwapPlayoffSecondSeed, ...
	stx.b tmp0
	jsr.w FindPlayoffDivisionSeed
	jsr.w SwapPlayoffSecondSeed
	jsr.w StorePlayoffSeeds
.rtl:								; return
	rtl

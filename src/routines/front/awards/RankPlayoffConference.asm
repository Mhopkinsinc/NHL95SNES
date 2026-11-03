RankPlayoffConference:				; builds the ranked playoff seed list for teams matching the conference
									; mask
	jsr.w ClearPlayoffSeedList
	ldy.b d0+2
.loop:								; loop: X = $000C,y, A = TeamDivisionCodes,x, ...
	ldx.w $000C,y
	lda.l TeamDivisionCodes,x
	bit.b tmp0
	beq .1
	jsr.w InsertPlayoffSeed
.1:									; A = $0002,y, Y = A, if the result is not 0 go to .loop, return
	lda.w $0002,y
	tay
	bne .loop
	rts

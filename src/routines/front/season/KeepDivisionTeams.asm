KeepDivisionTeams:					; keeps only the teams of division d1 in the sorted list at ListBuf
									; (TeamDivisionCodes by team against DivisionCodes), a1 = the count from
									; DivisionTeamCounts
	ldx.b d1
	lda.l DivisionCodes,x
	and.w #$00FF
	sta.b tmp0
	lda.l DivisionTeamCounts,x
	and.w #$00FF
	sta.b a1
	ldy.w #$0032
.loop:								; loop: X = ListBuf,y, A = $000C,x, X = A, A = TeamDivisionCodes,x, ...
	ldx.w ListBuf,y
	lda.w $000C,x
	tax
	lda.l TeamDivisionCodes,x
	and.w #$00FF
	cmp.b tmp0
	beq .1
	lda.w #$0000
	sta.w ListBuf,y
.1:									; Y - 1, Y - 1, if the result >= 0 go to .loop, X = $0000, ...
	dey
	dey
	bpl .loop
	ldx.w #$0000
	txy
.loop2:								; loop: if ListBuf,x = 0 go to .2, ListBuf,y = A, Y + 1, Y + 1
	lda.w ListBuf,x
	beq .2
	sta.w ListBuf,y
	iny
	iny
.2:									; X + 1, X + 1, if X < $0034 go to .loop2, return
	inx
	inx
	cpx.w #$0034
	bcc .loop2
	rts

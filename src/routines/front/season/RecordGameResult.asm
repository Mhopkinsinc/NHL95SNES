RecordGameResult:					; records game Y's result for both teams (RecordTeamResult): home by +8
									; against +$A, then away
	lda.w $0008,y
	cmp.w $000A,y
	php
	lda.w $0002,y
	plp
	jsr.w RecordTeamResult
	lda.w $000A,y
	cmp.w $0008,y
	php
	lda.w $0004,y
	plp
RecordTeamResult:					; adds a win (1), loss (2) or tie (3) for team A by the flags of the score
									; compare to its 2-bit results at SRTeamResults (21 bytes a team), in the
									; first free slot
	bcc RecordTeamLoss
	beq RecordTeamTie
	ldx.w #$0001
StoreTeamResult:					; puts result X (1 win, 2 loss, 3 tie) in the first free 2-bit slot of
									; team A's 21 bytes of SRTeamResults
	stx.b tmp1
	ldx.w #$0015
	phy
	jsl.l Mul8U
	ply
	tax
	sep #$20
.1:									; A = SRTeamResults,x, if a $03 bit set go to .2, A or tmp1, ...
	lda.l SRTeamResults,x
	bit.b #$03
	bne .2
	ora.b tmp1
	sta.l SRTeamResults,x
	bra .6
.2:									; if a $0C bit set go to .3, tmp1 * 2, tmp1 * 2, A or tmp1, ...
	bit.b #$0C
	bne .3
	asl.b tmp1
	asl.b tmp1
	ora.b tmp1
	sta.l SRTeamResults,x
	bra .6
.3:									; if a $30 bit set go to .4, A = tmp1, A * 2, A * 2, ...
	bit.b #$30
	bne .4
	lda.b tmp1
	asl a
	asl a
	asl a
	asl a
	ora.l SRTeamResults,x
	sta.l SRTeamResults,x
	bra .6
.4:									; if a $C0 bit set go to .5, A = tmp1, A or SRTeamResults,x, ...
	bit.b #$C0
	bne .5
	lda.b tmp1
	clc
	ror a
	ror a
	ror a
	ora.l SRTeamResults,x
	sta.l SRTeamResults,x
	bra .6
.5:									; X + 1, go to .1
	inx
	bra .1
.6:									; A 16-bit, return
	rep #$20
	rts

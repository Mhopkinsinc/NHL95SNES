LeagueLeadersScreen:				; League Menu League Leaders: the players leading a stat category (the pad
									; changes the stat); DrawLeagueLeaders redraws it
	jsl.l FadeOutWait
	ldx.b a0
	lda.w #$FC18
	sta.b $05,x
	sta.b $08,x
	stz.b $77
	stz.b $79
	stz.b d1+2
	pea.w $0000
DrawLeagueLeaders:					; draws the League Leaders page for the current category and starts its
									; scrolling list (DrawLeaderRow); screen state 8
	ldx.b $77
	jsl.l DeleteSprite
	ldx.b $79
	jsl.l DeleteSprite
	ldy.w #$5C00
	jsl.l ClearVRAM
	jsl.l ResetWorkBuf
	jsl.l InitTextMap
	jsl.l WaitTransfers
	pla
	jsr.w PrintPlayerCategory
	ldx.w #$559D
	lda.b d1+2
	lsr a
	bcc .1
	ldx.w #TxtBSwitchToLinemen&$FFFF
.1:									; $CF = $0018, call PrintBoldLeft, tmp0 = $027E
	ldy.w #$0018
	sty.b $CF
	jsl.l PrintBoldLeft
	lda.w #$027E
	sta.b tmp0
.loop:								; loop: A = tmp0, A - 1, tmp0 = A, call CreatedPlayerBits, ...
	lda.b tmp0
	dec a
	sta.b tmp0
	jsr.w CreatedPlayerBits
	jsr.w NextSaveBits3
	jsr.w NextSaveBits5
	beq .loop
	lda.w #$0010
	jsl.l AllocClearWorkBuf
	sta.b d0
	sta.b d0+2
	tay
	lda.b tmp0
	jsr.w FillLeaderEntry
	dec.b tmp0
.loop2:								; loop: call AddLeaderEntry, tmp0 - 1, ...
	jsr.w AddLeaderEntry
	dec.b tmp0
	bpl .loop2
	jsl.l MarkWorkBuf
	lda.b d0+2
	ldy.w #$FFFE
.loop3:								; loop: X = A, A = $0006,x, if the result is not 0 go to .2, Y + 1, ...
	tax
	lda.w $0006,x
	eor.b d1+2
	bne .2
	iny
	iny
	txa
	sta.w ListBuf,y
.2:									; if $0002,x is not 0 go to .loop3, A = Y, A / 2, a1 = A, ...
	lda.w $0002,x
	bne .loop3
	tya
	lsr a
	sta.b a1
	lda.w #LeagueLeadersPage&$FFFF
	jsl.l PrintTextPage
	jsl.l WaitTransfers
	stz.b a1+2
	lda.w #DrawLeaderRow
	ldx.w #$000D
	ldy.w #$0009
	jsr.w StartScrollList
	jsl.l SendTextMap
	jsl.l WaitTransfers
	lda.w #$0008
	sta.b d6+2
	stz.w fadein
	rts

DrawGMDecision:						; draws the trade decision: both teams, their chosen players
									; (PrintTradedPlayers), then Accepted, or Rejected with Illegal or
									; Advantage and the team (CheckTrade)
	jsr.w CheckTrade
	phx
	php
	lda.b $77
	ora.b $79
	bne .1
	plp
	pla
	pla
	jmp.w GameSetUp
.1:									; call FadeOutWait, DMAEnShadow = $8000, Y = $5000, ...
	jsl.l FadeOutWait
	lda.w #$8000
	sta.w DMAEnShadow
	ldy.w #$5000
	jsl.l QueueClearVRAM
	jsl.l WaitTransfers
	ldx.b a0
	lda.w #$012C
	sta.b $05,x
	ldx.b d3
	jsl.l DeleteSprite
	stz.b d3
	ldx.b d3+2
	jsl.l DeleteSprite
	stz.b d3+2
	jsl.l ResetWorkBuf
	jsl.l InitTextMap
	lda.w #EvaluateTradePage&$FFFF
	jsl.l PrintTextPage
	jsl.l WaitTransfers
	ldy.w #$2801
	ldx.w #$5084
	jsl.l MapTileBlock
	ldy.w #$2C01
	ldx.w #$5094
	jsl.l MapTileBlock
	ldy.w #$0005
	lda.w HomeTeam
	jsr.w PrintTeamNameLeft
	lda.w #$00A0
	sta.b $CF
	lda.w #$00E8
	sta.b $D1
	lda.w VisTeam
	asl a
	tax
	lda.l TeamCityNames,x
	tax
	ldy.w #$0005
	jsl.l PrintThinCentred
	lda.w #$0010
	sta.b $CF
	lda.w #HomeRoster
	sta.b d2
	ldy.w #$0008
	ldx.b $7B
	lda.w #ScratchBuf
	jsr.w PrintTradedPlayers
	lda.w #$0090
	sta.b $CF
	lda.w #VisRoster
	sta.b d2
	ldy.w #$0008
	ldx.b $7D
	lda.w #ScratchBuf+$64
	jsr.w PrintTradedPlayers
	lda.w #$0010
	sta.b $CF
	ldy.w #$0012
	plp
	bcs .2
	plx
	lda.w #$2400
	sta.b $D5
	ldx.w #TxtAccepted&$FFFF
	jsl.l PrintItalicLeft
	bra .5
.2:									; $D5 = $2800, X = TxtRejected&$FFFF, call PrintItalicLeft, ...
	lda.w #$2800
	sta.b $D5
	ldx.w #TxtRejected&$FFFF
	jsl.l PrintItalicLeft
	lda.w #$2000
	sta.b $D5
	lda.b $01,s
	cmp.b r3
	beq .3
	ldx.w #$4B7F
	bra .4
.3:									; X = TxtAdvantage&$FFFF
	ldx.w #TxtAdvantage&$FFFF
.4:									; Y = $0014, call PrintBoldLeft, $CF = $0061, pull A, ...
	ldy.w #$0014
	jsl.l PrintBoldLeft
	lda.w #$0061
	sta.b $CF
	pla
	asl a
	tax
	lda.l TeamCityNames,x
	tax
	ldy.w #$0014
	jsl.l PrintBoldLeft
.5:									; $D5 = $2000, call SendTextMap, return
	lda.w #$2000
	sta.b $D5
	jsl.l SendTextMap
	rts

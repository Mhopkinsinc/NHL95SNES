ShowOtherScores:					; Other Scores: the date and the other games (DrawOtherScoreRow draws each
									; row); from the pause menu, and from FinishSeasonDay with X: EXIT MENU
	jsl.l FadeOutWait
	jsl.l WaitTransfers
	jsr.w SetupScreen
	lda.w #$0010
	sta.b $CF
	lda.w #$00F0
	sta.b $D1
	ldx.w #TxtOtherScores&$FFFF
	ldy.w #$0002
	jsl.l PrintTitle
	lda.l SeasonDay
	and.w #$00FF
	tay
	asl a
	tax
	lda.l SeasonDates,x
	bne .1
	lda.w #$000D
	ldx.w #$5F52
	ldy.w #mesarea
	mvn $7E,$C3
	tya
	sec
	sbc.w #mesarea
	pha
	lda.l SRPODay
	inc a
	and.w #$00FF
	jsr.w BinToBCD
	plx
	jsr.w BCDTextAt
	stz.w mesarea,x
	bra .2
.1:									; A = Y, call MakeDateString
	tya
	jsr.w MakeDateString
.2:									; X = mesarea, Y = $0007, call PrintItalicCentredStr, Y = $0009, ...
	ldx.w #mesarea
	ldy.w #$0007
	jsl.l PrintItalicCentredStr
	ldy.w #$0009
	jsl.l PrintTitleBar
	lda.w SeasonScoresMode
	beq .3
	ldx.w #TxtXExitMenu&$FFFF
	ldy.w #$0019
	jsl.l PrintBoldLeft
.3:									; d0 = DayGameCount, X = $0000, Y = X
	lda.w DayGameCount
	sta.b d0
	ldx.w #$0000
	txy
.loop:								; loop: if $7F8EF8,x is not 0 go to .4, Y + 1
	lda.l $7F8EF8,x
	bne .4
	iny
.4:									; A = X, A + $010A, X = A, d0 - 1, ...
	txa
	clc
	adc.w #$010A
	tax
	dec.b d0
	bne .loop
	sty.b d0
	tya
	asl a
	adc.b d0
	bne .5
	pea.w PauseMenuReturn
	bra .6
.5:									; A - 1
	dec a
	pea.w DrawOtherScoreRow
.6:									; a1 = A, a1+2 = 0, pull A, X = $000B, ...
	sta.b a1
	stz.b a1+2
	pla
	ldx.w #$000B
	ldy.w #$000B
	jsr.w StartScrollList
	jsl.l SendTextMap
	stz.w fadestep
.loop2:								; loop: TransfersReady + 1, call ReadMenuPads, $26 + 1, ...
	inc.w TransfersReady
	wai
	jsl.l ReadMenuPads
	inc.b $26
	jsr.w ScrollListArrows
	jsl.l AnimateSprites
	lda.w #OAMBuf+$1FF
	sta.b $28
	lda.w #OAMHighBytes
	sta.b $2A
	jsl.l BuildSpriteOAM
	jsl.l PackOAMHigh
	lda.w repeatdelayframes
	bne .loop2
	lda.w padchangeany
	bit.w #$0040
	bne .9
	bit.w #$1000
	bne .10
	bit.w #$0800
	beq .7
	jsr.w ScrollListUp
	bra .loop2
.7:									; if $0400 bits clear go to .8, call ScrollListDown
	bit.w #$0400
	beq .8
	jsr.w ScrollListDown
.8:									; go to .loop2
	bra .loop2
.9:									; if SeasonScoresMode = 0 go to .loop2, SeasonScoresExit - 1
	lda.w SeasonScoresMode
	beq .loop2
	dec.w SeasonScoresExit
.10:								; go to ExitToPauseMenu
	jmp.w ExitToPauseMenu

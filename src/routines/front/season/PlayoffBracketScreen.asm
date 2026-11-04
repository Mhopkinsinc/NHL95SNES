PlayoffBracketScreen:				; the playoff bracket screen (GamesToday in play mode 3): the pad moves
									; the cursor over the series, the face buttons and L / R mark one, start
									; or select goes back to the League Menu
	jsr.w SetupPlayoffBracket
.1:									; call WaitTransfers, call ReadMenuPads, $26 + 1, ...
	jsl.l WaitTransfers
	jsl.l ReadMenuPads
	inc.b $26
	lda.w repeatdelayframes
	beq .2
	cmp.w #$0012
	bcc .9
	lda.w #$0007
	sta.w repeatdelayframes
.2:									; a2 = padchangeany, if $0100 bits clear go to .3, ...
	lda.w padchangeany
	sta.b a2
	bit.w #$0100
	beq .3
	jsr.w BracketCursorRight
	lda.b a2
.3:									; if $0200 bits clear go to .4, call BracketCursorLeft, A = a2
	bit.w #$0200
	beq .4
	jsr.w BracketCursorLeft
	lda.b a2
.4:									; if $0800 bits clear go to .5, call BracketCursorUp, A = a2
	bit.w #$0800
	beq .5
	jsr.w BracketCursorUp
	lda.b a2
.5:									; if $0400 bits clear go to .6, call BracketCursorDown, A = a2
	bit.w #$0400
	beq .6
	jsr.w BracketCursorDown
	lda.b a2
.6:									; if $0F00 bits clear go to .7, call DrawBracketSeriesSummary, A = a2
	bit.w #$0F00
	beq .7
	jsr.w DrawBracketSeriesSummary
	lda.b a2
.7:									; if $C0F0 bits clear go to .8, call BracketMarkSeries, A = a2
	bit.w #$C0F0
	beq .8
	jsr.w BracketMarkSeries
	lda.b a2
.8:									; if $3000 bits clear go to .9, go to ExitPlayoffBracket
	bit.w #$3000
	beq .9
	jmp.w ExitPlayoffBracket
.9:									; call ScrollBracketToCursor, call UpdateBracketWindows, ...
	jsr.w ScrollBracketToCursor
	jsr.w UpdateBracketWindows
	jsl.l AnimateSprites
	lda.w #OAMBuf+$1FF
	sta.b $28
	lda.w #OAMHighBytes
	sta.b $2A
	jsl.l BuildSpriteOAM
	jsl.l PackOAMHigh
	jmp.w .1

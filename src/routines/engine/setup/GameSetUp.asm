GameSetUp:							; the game setup screen (setoptions builds it): up / down pick a line,
									; left / right change it, start / select run the play mode
									; (PlayModeStarts); 360 frames with no key start the demo (StartDemo)
	jsr.w setoptions
	lda.w DemoMode
	beq .1
	jsl.l LoadSavedGameOptions
.1:									; fadein = 0, DemoMode = 0
	stz.w fadein
	stz.w DemoMode
.reenter:							; the idle count cleared, ...
									; after Start New
	stz.w SetupIdleTime
.loop:								; loop: TransfersReady + 1
	inc.w TransfersReady
.loop2:								; loop: if TransfersReady is not 0 go to .loop2, call ReadMenuPads, ...
	lda.w TransfersReady
	bne .loop2
	jsl.l ReadMenuPads
	inc.b $26
	ldx.b d6+2
	jsr (SetupScreenStates,x)
	jsl.l AnimateSprites
	lda.w #OAMBuf+$1FF
	sta.b $28
	lda.w #OAMHighBytes
	sta.b $2A
	jsl.l BuildSpriteOAM
	jsl.l PackOAMHigh
	lda.b d6+2
	bne .loop
	lda.w repeatdelayframes
	beq .2
	cmp.w #$0014
	bcc .loop
	lda.w #$000F
	sta.w repeatdelayframes
	bra .3
.2:									; SetupIdleTime = 0
	stz.w SetupIdleTime
.3:									; A = padchangeany, if $0800 bits clear go to .4, call SetupLineUp, ...
	lda.w padchangeany
	bit.w #$0800
	beq .4
	jsr.w SetupLineUp
	bra .8
.4:									; if $0400 bits clear go to .5, call SetupLineDown, go to .8
	bit.w #$0400
	beq .5
	jsr.w SetupLineDown
	bra .8
.5:									; if $0200 bits clear go to .6, call PrevOptionValue, go to .8
	bit.w #$0200
	beq .6
	jsr.w PrevOptionValue
	bra .8
.6:									; if $0100 bits clear go to .7, call NextOptionValue, go to .8
	bit.w #$0100
	beq .7
	jsr.w NextOptionValue
	bra .8
.7:									; if $3000 bits clear go to .8, A = OptPlayMode, A * 2, X = A, ...
	bit.w #$3000
	beq .8
	lda.w OptPlayMode
	asl a
	tax
	jmp (PlayModeStarts,x)
.8:									; A = SetupIdleTime, A + 1, if A >= $0168 go to StartDemo, ...
	lda.w SetupIdleTime
	inc a
	cmp.w #$0168
	bcs StartDemo
	sta.w SetupIdleTime
	jmp.w .loop

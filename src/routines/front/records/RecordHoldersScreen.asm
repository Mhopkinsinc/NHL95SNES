RecordHoldersScreen:				; pause menu Records: the user records (win percentages worked out and the
									; rows sorted), a page of win / loss records, goals or saves; the pad
									; changes the page, start returns
	jsl.l FadeOutWait
	jsl.l WaitTransfers
	jsr.w SetupScreen
	stz.b $7D
	lda.w #$0000
	tax
.1:									; a4 = X, push A, ScratchBuf,x = A, call GetUserName, ...
	stx.b a4
	pha
	sta.w ScratchBuf,x
	jsr.w GetUserName
	cpx.w #$0000
	beq .2
	ldy.w #$0000
	ldx.b a4
.loop:								; loop: A = mesarea,y, A and $00FF, ScratchBuf+$12,x = A, X + 1, ...
	lda.w mesarea,y
	and.w #$00FF
	sta.w ScratchBuf+$12,x
	inx
	iny
	cpy.w #$000C
	bne .loop
	lda.b $01,s
	jsr.w ReadUserRecord
	lda.b d4
	clc
	adc.b d3+2
	adc.b d3
.2:									; if zero go to .5, X = a4, ScratchBuf+$2,x = d0, ...
	beq .5
	ldx.b a4
	lda.b d0
	sta.w ScratchBuf+$2,x
	lda.b d1+2
	sta.w ScratchBuf+$6,x
	sep #$20
	lda.b d0+2
	sta.w ScratchBuf+$4,x
	lda.b d1
	sta.w ScratchBuf+$5,x
	lda.b d2
	sta.w ScratchBuf+$8,x
	lda.b d2+2
	sta.w ScratchBuf+$9,x
	rep #$20
	lda.b d4
	sta.w ScratchBuf+$E,x
	lda.b d3+2
	sta.w ScratchBuf+$C,x
	lda.b d3
	sta.w ScratchBuf+$A,x
	ldx.w #$0064
	jsl.l Mul16x8U
	lda.b d4
	clc
	adc.b d3+2
	bne .3
	lda.w #$0064
	bra .4
.3:									; A + d3, r1 = A, call Div32U_hi0entry, A = r0
	adc.b d3
	sta.b r1
	jsl.l Div32U_hi0entry
	lda.b r0
.4:									; X = a4, ScratchBuf+$10,x = A, A = X, A + $0020, ...
	ldx.b a4
	sta.w ScratchBuf+$10,x
	txa
	clc
	adc.w #$0020
	tax
	bra .6
.5:									; X = a4
	ldx.b a4
.6:									; pull A, A + 1, if A = $0008 go to .7, go to .1
	pla
	inc a
	cmp.w #$0008
	beq .7
	jmp.w .1
.7:									; A = X, A / 2, A / 2, A / 2, ...
	txa
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	sta.b a1
	lda.b a1
	sta.b tmp0
	beq .8
	lda.w #$FFFF
	sta.w ListBuf
	lda.w #$002D
	ldx.w #ListBuf
	ldy.w #ListBuf+$2
	mvn $7E,$7E
	ldx.w #$0000
.loop2:								; loop: tmp1 = X, A = ScratchBuf+$10,x, call InsertWinRecord, ...
	stx.b tmp1
	lda.w ScratchBuf+$10,x
	jsr.w InsertWinRecord
	lda.w ScratchBuf+$2,x
	jsr.w InsertGoalRecord
	lda.w ScratchBuf+$6,x
	jsr.w InsertSaveRecord
	txa
	clc
	adc.w #$0020
	tax
	dec.b tmp0
	bne .loop2
.8:									; A = RecordHoldersPage&$FFFF, call PrintTextPage
	lda.w #RecordHoldersPage&$FFFF
	jsl.l PrintTextPage
.9:									; if a1 is not 0 go to .10, $CF = $0010, $D1 = $00F0, $D5 = $2400, ...
	lda.b a1
	bne .10
	lda.w #$0010
	sta.b $CF
	lda.w #$00F0
	sta.b $D1
	lda.w #$2400
	sta.b $D5
	ldx.w #TxtNoRecordHolders&$FFFF
	ldy.w #$0006
	jsl.l PrintBoldCentred
	lda.w #$2000
	sta.b $D5
	bra .11
.10:								; A = $D3, A + $0180, Y = $02C0, call ClearRAM7E, ...
	lda.b $D3
	clc
	adc.w #$0180
	ldy.w #$02C0
	jsl.l ClearRAM7E
	jsl.l SendTextMap
	jsl.l WaitTransfers
	ldx.b $7D
	jsr (RecordPages,x)
.11:								; call SendTextMap, call WaitTransfers, fadestep = 0
	jsl.l SendTextMap
	jsl.l WaitTransfers
	stz.w fadestep
.loop3:								; loop: TransfersReady + 1, call ReadMenuPads, $26 + 1, ...
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
	bne .loop3
	lda.w padchangeany
	bit.w #$1000
	beq .12
	jmp.w ExitToPauseMenu
.12:								; if a1 = 0 go to .loop3, if $0100 bits clear go to .14, A = $7D, ...
	ldx.b a1
	beq .loop3
	bit.w #$0100
	beq .14
	lda.b $7D
	inc a
	inc a
	cmp.w #$0006
	bcc .13
	lda.w #$0000
.13:								; $7D = A, go to .9
	sta.b $7D
	jmp.w .9
.14:								; if $0200 bits clear go to .loop3, A = $7D, A - 1, A - 1, ...
	bit.w #$0200
	beq .loop3
	lda.b $7D
	dec a
	dec a
	bpl .13
	lda.w #$0004
	bra .13

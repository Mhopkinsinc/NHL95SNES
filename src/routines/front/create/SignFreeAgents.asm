SignFreeAgents:						; the Hire Free Agents screen: the free agents (up / down, B marks one);
									; start hires them (SignMarkedAgents), X leaves
	jsl.l CheckTradesFrozen
	jsl.l FadeOutWait
	jsr.w SetupFreeAgentsScreen
	stz.w fadestep
.loop:								; loop: TransfersReady + 1, call ReadMenuPads, $26 + 1, ...
	inc.w TransfersReady
	wai
	jsl.l ReadMenuPads
	inc.b $26
	jsr.w ScrollListArrows
	ldx.b a0
	lda.b d1+2
	asl a
	asl a
	asl a
	adc.w #$0076
	sta.b $08,x
	jsl.l AnimateSprites
	lda.w #OAMBuf+$1FF
	sta.b $28
	lda.w #OAMHighBytes
	sta.b $2A
	jsl.l BuildSpriteOAM
	jsl.l PackOAMHigh
	lda.w repeatdelayframes
	bne .loop
	lda.w padchangeany
	bit.w #$1000
	beq .1
	lda.b a1
	beq .2
	jmp.w SignMarkedAgents
.1:									; if $0040 bits clear go to .3
	bit.w #$0040
	beq .3
.2:									; go to GameSetUp
	jmp.w GameSetUp
.3:									; if a1 = 0 go to .loop, if $0800 bits clear go to .5, ...
	ldx.b a1
	beq .loop
	bit.w #$0800
	beq .5
	lda.b d1+2
	beq .4
	dec a
	sta.b d1+2
	bra .loop
.4:									; call ScrollListUp, go to .loop
	jsr.w ScrollListUp
	bra .loop
.5:									; if $0400 bits clear go to .7, if d1+2 >= $0007 go to .6, A + a1+2, ...
	bit.w #$0400
	beq .7
	lda.b d1+2
	cmp.w #$0007
	bcs .6
	sec
	adc.b a1+2
	cmp.b a1
	beq .loop
	inc.b d1+2
	bra .loop
.6:									; call ScrollListDown, go to .loop
	jsr.w ScrollListDown
	jmp.w .loop
.7:									; if $8000 bits clear go to .15, A = d1+2, A + a1+2, X = A, ...
	bit.w #$8000
	beq .15
	lda.b d1+2
	clc
	adc.b a1+2
	tax
	lda.w ScratchBuf,x
	bit.w #$0040
	bne .8
	bit.w #$0080
	beq .8
	jmp.w .loop
.8:									; A xor $0040, ScratchBuf,x = A, if $0040 bits clear go to .11, ...
	eor.w #$0040
	sta.w ScratchBuf,x
	bit.w #$0040
	beq .11
	and.w #$000F
	bne .9
	inc.b d0
	bra .14
.9:									; if A >= $0003 go to .10, d1 + 1, go to .14
	cmp.w #$0003
	bcs .10
	inc.b d1
	bra .14
.10:								; d0+2 + 1, go to .14
	inc.b d0+2
	bra .14
.11:								; if the result is not 0 go to .12, d0 - 1, go to .14
	and.w #$000F
	bne .12
	dec.b d0
	bra .14
.12:								; if A >= $0003 go to .13, d1 - 1, go to .14
	cmp.w #$0003
	bcs .13
	dec.b d1
	bra .14
.13:								; d0+2 - 1
	dec.b d0+2
.14:								; call MarkFreeAgentLimits, call PrintPositionCounts, ...
	jsr.w MarkFreeAgentLimits
	jsr.w PrintPositionCounts
	jsr.w RedrawScrollList
	jsl.l SendTextMap
.15:								; go to .loop
	jmp.w .loop

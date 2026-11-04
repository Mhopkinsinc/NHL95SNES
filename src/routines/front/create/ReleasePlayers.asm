ReleasePlayers:						; the Release Players screen: a team's roster (up / down, B marks a
									; player); start releases them (ReleaseMarkedPlayers), X leaves
	jsl.l CheckTradesFrozen
	jsl.l FadeOutWait
	jsr.w DrawReleasePage
	stz.w fadein
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
	jmp.w ReleaseMarkedPlayers
.1:									; if $0040 bits clear go to .2, go to GameSetUp
	bit.w #$0040
	beq .2
	jmp.w GameSetUp
.2:									; if $0800 bits clear go to .4, if d1+2 = 0 go to .3, A - 1, d1+2 = A, ...
	bit.w #$0800
	beq .4
	lda.b d1+2
	beq .3
	dec a
	sta.b d1+2
	bra .loop
.3:									; call ScrollListUp, go to .loop
	jsr.w ScrollListUp
	bra .loop
.4:									; if $0400 bits clear go to .6, if d1+2 >= $0007 go to .5, A + a1+2, ...
	bit.w #$0400
	beq .6
	lda.b d1+2
	cmp.w #$0007
	bcs .5
	sec
	adc.b a1+2
	cmp.b a1
	beq .loop
	inc.b d1+2
	bra .loop
.5:									; call ScrollListDown, go to .loop
	jsr.w ScrollListDown
	jmp.w .loop
.6:									; if $8000 bits clear go to .loop, Y = VisRoster, A = a1+2, A + d1+2, ...
	bit.w #$8000
	beq .loop
	ldy.w #VisRoster
	lda.b a1+2
	clc
	adc.b d1+2
	tax
	lda.w ScratchBuf,x
	bit.w #$0001
	beq .7
	txa
	sec
	sbc.w $0002,y
	bmi .8
	sbc.w $0004,y
	bmi .10
	bra .12
.7:									; A = X, A - $0002,y, if the result >= 0 go to .9, if d0 < $0003 go to .16
	txa
	sec
	sbc.w $0002,y
	bpl .9
	lda.b d0
	cmp.w #$0003
	bcc .16
.8:									; tmp0 = $007F, go to .13
	lda.w #$007F
	sta.b tmp0
	bra .13
.9:									; A - $0004,y, if the result >= 0 go to .11, if d0+2 < $000A go to .16
	sbc.w $0004,y
	bpl .11
	lda.b d0+2
	cmp.w #$000A
	bcc .16
.10:								; tmp0 = $0081, go to .13
	lda.w #$0081
	sta.b tmp0
	bra .13
.11:								; if d1 < $0007 go to .16
	lda.b d1
	cmp.w #$0007
	bcc .16
.12:								; tmp0 = $0083
	lda.w #$0083
	sta.b tmp0
.13:								; A = ScratchBuf,x, A xor $0001, ScratchBuf,x = A, ...
	lda.w ScratchBuf,x
	eor.w #$0001
	sta.w ScratchBuf,x
	bit.w #$0001
	beq .14
	lda.b (tmp0)
	dec a
	sta.b (tmp0)
	bra .15
.14:								; A = (tmp0), A + 1, (tmp0) = A
	lda.b (tmp0)
	inc a
	sta.b (tmp0)
.15:								; call PrintPositionCounts, call RedrawScrollList, call SendTextMap
	jsr.w PrintPositionCounts
	jsr.w RedrawScrollList
	jsl.l SendTextMap
.16:								; go to .loop
	jmp.w .loop

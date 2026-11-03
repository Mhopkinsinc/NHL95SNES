ShowMatchups:						; draws matchup 0-6 of the scouting report (the two players, or the
									; goalies and Overall)
	lda.b $D3
	clc
	adc.w #$0140
	ldy.w #$0240
	jsl.l ClearRAM7E
	jsl.l SendTextMap
	jsl.l WaitTransfers
	ldx.b d7
	lda.b $22,x
	and.w #$FFFE
	sta.b $22,x
	ldx.b d7+2
	lda.b $22,x
	and.w #$FFFE
	sta.b $22,x
	ldx.b d6
	lda.b $22,x
	ora.w #$0001
	sta.b $22,x
	ldx.b d6+2
	lda.b $22,x
	ora.w #$0001
	sta.b $22,x
	jsl.l MarkWorkBuf
	ldx.w curmatchup
	cpx.w #$0005
	bcc .2
	beq .1
	jmp.w .12
.1:									; go to .7
	jmp.w .7
.2:									; A = HomeRoster+109,x, A and $00FF, A - 1, A * 2, ...
	lda.w HomeRoster+109,x
	and.w #$00FF
	dec a
	asl a
	tay
	lda.w HomeRoster+222,y
	sta.b a0
	and.w #$00FF
	sta.b a2+2
	tax
	cmp.w #$00FF
	beq .3
	lda.w HomeRoster+172,y
	sta.b a2
	clc
	adc.w #$00C0
	phy
	ldy.b $64
	jsr.w UnpackPlayerPhoto
	tay
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	pea.w $0480
	pea.w $0130
	pea.w $007E
	phy
	ldy.b VRAMQueueSP
	tsx
	stx.b VRAMQueueSP
	ldx.b CGRAMQueueSP
	txs
	sty.b CGRAMQueueSP
	pea.w $0020
	pea.w $0040
	pei ($6D)
	lda.b a0
	and.w #$FF00
	lsr a
	lsr a
	lsr a
	adc.b a2
	pha
	lda.b CGRAMQueueSP
	tsx
	tcs
	stx.b CGRAMQueueSP
	stz.b QueueBusy
	ply
	bra .4
.3:									; call ScoutUseHomeTeamLogo
	jsr.w ScoutUseHomeTeamLogo
.4:									; X = curmatchup, A = VisRoster+109,x, A and $00FF, A - 1, ...
	ldx.w curmatchup
	lda.w VisRoster+109,x
	and.w #$00FF
	dec a
	asl a
	tay
	lda.w VisRoster+222,y
	sta.b a0
	and.w #$00FF
	sta.b a2+2
	tax
	cmp.w #$00FF
	beq .5
	lda.w VisRoster+172,y
	sta.b a2
	clc
	adc.w #$00C0
	phy
	ldy.b $64
	jsr.w UnpackPlayerPhoto
	tay
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	pea.w $0480
	pea.w $0370
	pea.w $007E
	phy
	ldy.b VRAMQueueSP
	tsx
	stx.b VRAMQueueSP
	ldx.b CGRAMQueueSP
	txs
	sty.b CGRAMQueueSP
	pea.w $0020
	pea.w $0050
	pei ($6D)
	lda.b a0
	and.w #$FF00
	lsr a
	lsr a
	lsr a
	adc.b a2
	pha
	lda.b CGRAMQueueSP
	tsx
	tcs
	stx.b CGRAMQueueSP
	stz.b QueueBusy
	ply
	bra .6
.5:									; call ScoutUseVisTeamLogo
	jsr.w ScoutUseVisTeamLogo
.6:									; call RefreshSpritesLong, $CF = $0018, $D1 = $0050, a2 = $0002, ...
	jsl.l RefreshSpritesLong
	lda.w #$0018
	sta.b $CF
	lda.w #$0050
	sta.b $D1
	lda.w #$0002
	sta.b a2
	ldx.w curmatchup
	lda.w VisRoster+109,x
	and.w #$00FF
	dec a
	sta.b d0
	pha
	lda.w #$5DF9
	sta.b d4
	stz.b d4+2
	lda.w #$0001
	sta.l $7E24DC
	jsl.l CalcRosterAttribLong
	jsl.l BinToBCDLong
	jsl.l BCDTextLong
	ldx.w #mesarea
	ldy.w #$000B
	jsl.l PrintBoldCentredStr
	jsl.l WaitTransfers
	pla
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w #$331F
	tax
	lda.w #$000C
	jsl.l FitNameToWorkBuf
	ldy.w #$000C
	jsl.l PrintBoldLeftStr
	jsl.l WaitTransfers
	lda.w #$00B0
	sta.b $CF
	lda.w #$00E8
	sta.b $D1
	stz.b a2
	ldx.w curmatchup
	lda.w HomeRoster+109,x
	and.w #$00FF
	dec a
	sta.b d0
	pha
	lda.w #$5DF9
	sta.b d4
	stz.b d4+2
	lda.w #$0001
	sta.l $7E24DC
	jsl.l CalcRosterAttribLong
	jsl.l BinToBCDLong
	jsl.l BCDTextLong
	ldx.w #mesarea
	ldy.w #$000B
	jsl.l PrintBoldCentredStr
	jsl.l WaitTransfers
	pla
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w #$2EE1
	tax
	lda.w #$000C
	jsl.l FitNameToWorkBuf
	ldy.w #$000C
	jsl.l PrintBoldRightStr
	jsl.l WaitTransfers
	lda.w #$0010
	sta.b $CF
	lda.w #$00F0
	sta.b $D1
	lda.w curmatchup
	asl a
	tax
	lda.l PositionLongNames,x
	tax
	ldy.w #$0007
	jsl.l PrintBoldCentred
	jsl.l WaitTransfers
	jsl.l SendTextMap
	jsl.l WaitTransfers
	jsl.l RestoreWorkBuf
	rts
.7:									; a0 = HomeRoster+222, A and $00FF, a2+2 = A, X = A, ...
	lda.w HomeRoster+222
	sta.b a0
	and.w #$00FF
	sta.b a2+2
	tax
	cmp.w #$00FF
	beq .8
	lda.w HomeRoster+172
	sta.b a2
	clc
	adc.w #$00C0
	ldy.b $64
	jsr.w UnpackPlayerPhoto
	tay
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	pea.w $0480
	pea.w $0130
	pea.w $007E
	phy
	ldy.b VRAMQueueSP
	tsx
	stx.b VRAMQueueSP
	ldx.b CGRAMQueueSP
	txs
	sty.b CGRAMQueueSP
	pea.w $0020
	pea.w $0040
	pei ($6D)
	lda.b a0
	and.w #$FF00
	lsr a
	lsr a
	lsr a
	adc.b a2
	pha
	lda.b CGRAMQueueSP
	tsx
	tcs
	stx.b CGRAMQueueSP
	stz.b QueueBusy
	bra .9
.8:									; call ScoutUseHomeTeamLogo
	jsr.w ScoutUseHomeTeamLogo
.9:									; a0 = VisRoster+222, A and $00FF, a2+2 = A, X = A, ...
	lda.w VisRoster+222
	sta.b a0
	and.w #$00FF
	sta.b a2+2
	tax
	cmp.w #$00FF
	beq .10
	lda.w VisRoster+172
	sta.b a2
	clc
	adc.w #$00C0
	ldy.b $64
	jsr.w UnpackPlayerPhoto
	tay
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	pea.w $0480
	pea.w $0370
	pea.w $007E
	phy
	ldy.b VRAMQueueSP
	tsx
	stx.b VRAMQueueSP
	ldx.b CGRAMQueueSP
	txs
	sty.b CGRAMQueueSP
	pea.w $0020
	pea.w $0050
	pei ($6D)
	lda.b a0
	and.w #$FF00
	lsr a
	lsr a
	lsr a
	adc.b a2
	pha
	lda.b CGRAMQueueSP
	tsx
	tcs
	stx.b CGRAMQueueSP
	stz.b QueueBusy
	bra .11
.10:								; call ScoutUseVisTeamLogo
	jsr.w ScoutUseVisTeamLogo
.11:								; call RefreshSpritesLong, $CF = $00B0, $D1 = $00E8, a2 = 0, ...
	jsl.l RefreshSpritesLong
	lda.w #$00B0
	sta.b $CF
	lda.w #$00E8
	sta.b $D1
	stz.b a2
	stz.b d0
	lda.w #$F0C9
	sta.b d4
	lda.w #$0010
	sta.b d4+2
	lda.w #$0001
	sta.l $7E24DC
	jsl.l CalcRosterAttribLong
	jsl.l BinToBCDLong
	jsl.l BCDTextLong
	ldx.w #mesarea
	ldy.w #$000B
	jsl.l PrintBoldCentredStr
	ldx.w #$2EE1
	lda.w #$000C
	jsl.l FitNameToWorkBuf
	ldy.w #$000C
	jsl.l PrintBoldRightStr
	jsl.l WaitTransfers
	lda.w #$0018
	sta.b $CF
	lda.w #$0050
	sta.b $D1
	lda.w #$0002
	sta.b a2
	stz.b d0
	lda.w #$F0C9
	sta.b d4
	lda.w #$0010
	sta.b d4+2
	lda.w #$0001
	sta.l $7E24DC
	jsl.l CalcRosterAttribLong
	jsl.l BinToBCDLong
	jsl.l BCDTextLong
	ldx.w #mesarea
	ldy.w #$000B
	jsl.l PrintBoldCentredStr
	ldx.w #$331F
	lda.w #$000C
	jsl.l FitNameToWorkBuf
	ldy.w #$000C
	jsl.l PrintBoldLeftStr
	jsl.l WaitTransfers
	lda.w #$0010
	sta.b $CF
	lda.w #$00F0
	sta.b $D1
	ldx.w #TxtGoalie&$FFFF
	ldy.w #$0007
	jsl.l PrintBoldCentred
	jsl.l WaitTransfers
	jsl.l SendTextMap
	jsl.l WaitTransfers
	jsl.l RestoreWorkBuf
	rts
.12:								; mesarea = 0, ScratchBuf = 0, X = ScratchBuf, Y = ScratchBuf+$2, ...
	stz.w mesarea
	stz.w ScratchBuf
	ldx.w #ScratchBuf
	ldy.w #ScratchBuf+$2
	lda.w #$047D
	mvn $7E,$7E
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	pea.w $0480
	pea.w $0130
	pea.w $007E
	pea.w ScratchBuf
	pea.w $0480
	pea.w $0370
	pea.w $007E
	pea.w ScratchBuf
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	stz.b QueueBusy
	ldx.b d7
	lda.b $22,x
	ora.w #$0001
	sta.b $22,x
	ldx.b d7+2
	lda.b $22,x
	ora.w #$0001
	sta.b $22,x
	ldx.b d6
	lda.b $22,x
	and.w #$FFFE
	sta.b $22,x
	ldx.b d6+2
	lda.b $22,x
	and.w #$FFFE
	sta.b $22,x
	jsl.l RefreshSpritesLong
	lda.w #$0010
	sta.b $CF
	lda.w #$00F0
	sta.b $D1
	ldx.w #TxtOverall&$FFFF
	ldy.w #$0008
	jsl.l PrintBoldCentred
	jsl.l WaitTransfers
	lda.w #$0018
	sta.b $CF
	lda.w #$0050
	sta.b $D1
	lda.w VisTeam
	asl a
	tax
	lda.l $C30000,x
	tax
	adc.l $C30006,x
	tax
	lda.l $C30004,x
	and.w #$00FF
	jsl.l BinToBCDLong
	jsl.l BCDTextLong
	ldx.w #mesarea
	ldy.w #$000B
	jsl.l PrintBoldCentredStr
	jsl.l WaitTransfers
	lda.w #$00B0
	sta.b $CF
	lda.w #$00E8
	sta.b $D1
	lda.w HomeTeam
	asl a
	tax
	lda.l $C30000,x
	tax
	adc.l $C30006,x
	tax
	lda.l $C30004,x
	and.w #$00FF
	jsl.l BinToBCDLong
	jsl.l BCDTextLong
	ldx.w #mesarea
	ldy.w #$000B
	jsl.l PrintBoldCentredStr
	jsl.l SendTextMap
	jsl.l WaitTransfers
	rts

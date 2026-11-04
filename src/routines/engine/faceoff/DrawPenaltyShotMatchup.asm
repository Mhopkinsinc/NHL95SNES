DrawPenaltyShotMatchup:				; draws the penalty shot box: the shooter's and the other team's goalie's
									; names centred, the text and the 30 second time, then FinishFaceoffSetup
	jsl.l WaitTransfers
	ldx.w #$0014
	ldy.w #$0008
	lda.w #$5846
	jsl.l Framer
	ldx.w #HomeRoster
	ldy.w BA_Team
	beq .1
	ldx.w #VisRoster
.1:									; A = BA_Skater_Offset, call FormatRosterShortName, call CentreNameX, ...
	lda.w BA_Skater_Offset
	jsl.l FormatRosterShortName
	jsr.w CentreNameX
	adc.w #$58A6
	tay
	lda.b r0
	jsl.l QueueVRAMDMALen
	ldy.w #$58EF
	ldx.w #$00C3
	lda.w #$5F13
	jsl.l QueueVRAMDMALen
	ldx.w #VisRoster
	ldy.w BA_Team
	beq .2
	ldx.w #HomeRoster
.2:									; A = Y, A xor $0002, Y = A, A = tmgoalie,y, ...
	tya
	eor.w #$0002
	tay
	lda.w tmgoalie,y
	jsl.l FormatRosterShortName
	jsr.w CentreNameX
	adc.w #$5926
	tay
	lda.b r0
	jsl.l QueueVRAMDMALen
	ldy.w #$5867
	lda.w #$5F40
	ldx.w #$00C3
	jsl.l QueueVRAMDMALen
	ldx.w #$000A
	ldy.w #$0003
	lda.w #$5AE0
	jsl.l Framer
	lda.w #$5F4A
	ldx.w #$00C3
	ldy.w #$5B01
	jsl.l QueueVRAMDMALen
	lda.w #$001E
	sta.b d0
	jsl.l PushTime
	ldx.w #$007E
	lda.b a1
	ldy.w #$5B23
	jsl.l QueueVRAMDMALen
	jmp.w FinishFaceoffSetup

ScoutUseHomeTeamLogo:				; clears the right photo tiles and shows the home team logo
	stz.w mesarea
	stz.w ScratchBuf
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	pea.w $0480
	pea.w $0130
	pea.w $007E
	lda.w #$0480
	jsl.l AllocClearWorkBuf
	pha
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	stz.b QueueBusy
	ldx.b d7+2
	lda.b $22,x
	ora.w #$0001
	sta.b $22,x
	ldx.b d6+2
	lda.b $22,x
	and.w #$FFFE
	sta.b $22,x
	rts

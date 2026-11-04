GoalBoxPlayer:						; a goal box row: the number of player A of the roster at a2 (32 bytes a
									; player), his name fitted to 13 letters, queued at a3; a3 to the next row
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.b a2
	sta.b a3+2
	tax
	lda.w $0000,x
	and.w #$00FF
	jsr.w BinToBCD
	jsr.w BCDText
	lda.w #$0020
	sta.w mesarea,x
	txa
	sec
	adc.w #mesarea
	tay
	lda.b a3+2
	clc
	adc.w #$0008
	tax
	lda.w #$000D
	jsr.w FitName
	ldx.w #mesarea
	jsr.w StringToBoxTiles
	jsl.l CopyString2
	txa
	ldx.w #$007E
	ldy.b a3
	jsl.l QueueVRAMDMALen
	lda.b a3
	clc
	adc.w #$0020
	sta.b a3
	rts

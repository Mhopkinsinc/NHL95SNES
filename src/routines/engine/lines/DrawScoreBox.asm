DrawScoreBox:						; the score box: its frame (Framer, 9 x 3), the visitors' and the home
									; team's short names (PackTeamSecondText) and their scores (tmscore+2,
									; tmscore) to the text map by DMA
	ldx.w #$0009
	ldy.w #$0003
	lda.w #$5AF7
	jsl.l Framer
	lda.w VisTeam
	jsr.w PackTeamSecondText
	ldy.w #$5B18
	jsl.l QueueVRAMDMALen
	lda.w HomeTeam
	jsr.w PackTeamSecondText
	ldy.w #$5B1C
	jsl.l QueueVRAMDMALen
	lda.w tmscore+2
	jsr.w BinToBCD
	jsr.w BCDText
	ldx.w #mesarea
	jsr.w PackShortText
	ldy.w #$5B38
	jsl.l QueueVRAMDMALen
	lda.w tmscore
	jsr.w BinToBCD
	jsr.w BCDText
	ldx.w #mesarea
	jsr.w PackShortText
	ldy.w #$5B3C
	jmp.w QueueVRAMDMALen

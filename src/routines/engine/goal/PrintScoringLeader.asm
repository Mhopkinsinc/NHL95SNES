PrintScoringLeader:					; queue the team and player name of one scoring leader
	stx.b a0+2
	lda.w #$0000
	cpx.w #$001A
	bcc .1
	inc a
.1:									; call TeamSecondTextLong, call UnpackText2, ...
	jsl.l TeamSecondTextLong
	jsl.l UnpackText2
	jsl.l StringToBoxTilesLong
	txa
	ldx.w #$007E
	ldy.b a0
	jsl.l QueueVRAMDMALen
	lda.b a0+2
	asl a
	asl a
	asl a
	asl a
	asl a
	cmp.w #$0340
	bcc .2
	adc.w #$2FDE
	bra .3
.2:									; A + $2EE1
	adc.w #$2EE1
.3:									; X = A, A = $000D, call FitNameToWorkBuf, call StringToBoxTilesLong, ...
	tax
	lda.w #$000D
	jsl.l FitNameToWorkBuf
	jsl.l StringToBoxTilesLong
	txa
	ldx.w #$007E
	ldy.b a0
	iny
	iny
	iny
	iny
	jsl.l QueueVRAMDMALen
	lda.b a0
	clc
	adc.w #$0020
	sta.b a0
	rts

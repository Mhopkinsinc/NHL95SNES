DrawDayGames:						; draws day d0's games on Games Today: d1 its schedule entry, d2 its game
									; count, the first two games' names, colours and marks, the down arrow
									; when there are 3 or more
	jsr.w DayFirstGame
	lda.w #$FFFA
	sta.w BG2VScroll
	lda.w #$00EB
	sta.b d3
	asl a
	adc.b $D3
	ldy.w #$0540
	jsl.l ClearRAM7E
	jsl.l SendTextMap
	ldy.w #$5000
	jsl.l QueueClearVRAM
	jsl.l WaitTransfers
	lda.w #$0011
	sta.w ScratchBuf+$4
	ldx.b a0
	lda.w #$0060
	sta.b $08,x
	lda.w #$0058
	sta.b $CF
	lda.w #$00A0
	sta.b $D1
	lda.b d0
	asl a
	tax
	lda.l SeasonSchedule,x
	sta.b d1
	stz.b d1+2
	tax
	lda.l $C30000,x
	and.w #$00FF
	sta.b d2
	jsr.w ClearGameSlot
	pha
	ldx.b d1
	lda.l $C30001,x
	pha
	and.w #$00FF
	ldx.w #$0020
	jsr.w QueueTeamPalette
	asl a
	tax
	lda.l TeamCityNames,x
	tax
	jsl.l PrintThinCentred
	pla
	xba
	and.w #$00FF
	ldx.w #$0030
	jsr.w QueueTeamPalette
	asl a
	tax
	lda.l TeamCityNames,x
	tax
	pla
	adc.w #$0003
	tay
	jsl.l PrintThinCentred
	jsr.w DrawGameMarks
	sec
	jsr.w ClearGameSlot
	ldx.b d2
	dex
	beq .1
	pha
	ldx.b d1
	lda.l $C30003,x
	pha
	and.w #$00FF
	ldx.w #$0040
	jsr.w QueueTeamPalette
	asl a
	tax
	lda.l TeamCityNames,x
	tax
	jsl.l PrintThinCentred
	clc
	pei ($8B)
	lda.b d3
	adc.w #$00E0
	and.w #$03FF
	sta.b d3
	inc.b d1+2
	jsr.w DrawGameMarks
	dec.b d1+2
	pla
	sta.b d3
	pla
	xba
	and.w #$00FF
	ldx.w #$0050
	jsr.w QueueTeamPalette
	asl a
	tax
	lda.l TeamCityNames,x
	tax
	pla
	adc.w #$0003
	tay
	jsl.l PrintThinCentred
.1:									; call WaitTransfers, ScratchBuf+$4 = $0017, X = a4, A = $22,x, ...
	jsl.l WaitTransfers
	lda.w #$0017
	sta.w ScratchBuf+$4
	ldx.b a4
	lda.b $22,x
	and.w #$FFFE
	sta.b $22,x
	ldx.b $75
	lda.b $22,x
	and.w #$FFFE
	ldy.b d2
	cpy.w #$0003
	bcc .2
	ora.w #$0001
.2:									; $22,x = A, return
	sta.b $22,x
	rts

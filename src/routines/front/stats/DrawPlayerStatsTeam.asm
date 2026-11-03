DrawPlayerStatsTeam:				; DrawStatsTeam with the logo at x $DE, y $25 (Season Player Stats)
	lda.w #$00DE
	sta.b $18
	lda.w #$0025
	sta.b $1A
DrawStatsTeam:						; the stats screens' team: HomeTeam's logo sprite (d7) at $18 / $1A with
									; its colours, its name thin and centred between x $40 and $88 on row 6
	ldx.b d7
	jsl.l DeleteSprite
	stz.b d7
	jsr.w QueueHomePalette
	lda.w HomeTeam
	jsl.l CreateSprite
	stx.b d7
	lda.w #$0001
	sta.b $26
	jsr.w RefreshSprites
	lda.w #$0040
	sta.b $CF
	lda.w #$0088
	sta.b $D1
	clc
	lda.b $D3
	adc.w #$0180
	ldy.w #$0080
	jsl.l ClearRAM7E
	jsl.l SendTextMap
	lda.w HomeTeam
	asl a
	tax
	lda.l TeamCityNames,x
	tax
	ldy.w #$0006
	jsl.l PrintThinCentred
	jsl.l WaitTransfers
	rts

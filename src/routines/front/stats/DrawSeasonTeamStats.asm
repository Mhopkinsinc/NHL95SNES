DrawSeasonTeamStats:				; draws the season stats of the current team (record, goals, save and
									; shooting percentages, shots)
	lda.w #$00D4
	sta.b $18
	lda.w #$0025
	sta.b $1A
	jsr.w DrawStatsTeam
	lda.w #$000F
	sta.b tmp0
	clc
	lda.b $D3
	adc.w #$022C
	jsr.w ClearTextColumn
	lda.w #$0001
	sta.b tmp0
	clc
	lda.b $D3
	adc.w #$0266
	jsr.w ClearTextColumn
	jsl.l SendTextMap
	jsl.l WaitTransfers
	lda.w #$00F8
	sta.b $D1
	lda.w HomeTeam
	jsr.w BuildTeamSeasonRecord
	phy
	lda.w $0004,y
	jsr.w BinToBCD
	jsr.w BCDText
	lda.w #$003E
	sta.w mesarea,x
	inx
	lda.w $0006,y
	phx
	jsr.w BinToBCD
	plx
	jsr.w BCDTextAt
	lda.w #$003E
	sta.w mesarea,x
	inx
	lda.w $0008,y
	phx
	jsr.w BinToBCD
	plx
	jsr.w BCDTextAt
	ldx.w #mesarea
	ldy.w #$0009
	jsl.l PrintItalicRightStr
	ply
	phy
	lda.w $0010,y
	jsr.w BinToBCD
	sta.b r2
	xba
	and.w #$00FF
	jsr.w BCDText
	lda.w #$003D
	sta.w mesarea,x
	inx
	lda.b r2
	and.w #$00F0
	lsr a
	lsr a
	lsr a
	lsr a
	jsr.w BCDTextAt
	lda.b r2
	and.w #$000F
	jsr.w BCDTextAt
	ldx.w #mesarea
	ldy.w #$000B
	jsl.l PrintItalicRightStr
	ply
	phy
	lda.w $0012,y
	jsr.w BinToBCD
	sta.b r2
	xba
	and.w #$00FF
	jsr.w BCDText
	lda.w #$003D
	sta.w mesarea,x
	inx
	lda.b r2
	and.w #$00F0
	lsr a
	lsr a
	lsr a
	lsr a
	jsr.w BCDTextAt
	lda.b r2
	and.w #$000F
	jsr.w BCDTextAt
	ldx.w #mesarea
	ldy.w #$000D
	jsl.l PrintItalicRightStr
	ply
	phy
	lda.w $0014,y
	jsr.w BinToBCD
	jsr.w BCDText
	ldx.w #mesarea
	ldy.w #$000F
	jsl.l PrintItalicRightStr
	ply
	phy
	lda.w $0016,y
	jsr.w BinToBCD
	jsr.w BCDText
	ldx.w #mesarea
	ldy.w #$0011
	jsl.l PrintItalicRightStr
	ply
	phy
	lda.w $001A,y
	jsr.w BinToBCD
	sta.b r2
	xba
	and.w #$00FF
	jsr.w BCDText
	lda.w #$003D
	sta.w mesarea,x
	inx
	lda.b r2
	and.w #$00F0
	lsr a
	lsr a
	lsr a
	lsr a
	jsr.w BCDTextAt
	lda.b r2
	and.w #$000F
	jsr.w BCDTextAt
	ldx.w #mesarea
	ldy.w #$0013
	jsl.l PrintItalicRightStr
	ply
	phy
	lda.w $0030,y
	jsr.w BinToBCD
	sta.b r2
	xba
	and.w #$00FF
	jsr.w BCDText
	lda.w #$003D
	sta.w mesarea,x
	inx
	lda.b r2
	and.w #$00F0
	lsr a
	lsr a
	lsr a
	lsr a
	jsr.w BCDTextAt
	lda.b r2
	and.w #$000F
DrawSeasonTeamStatsFinish:			; appends the final shots allowed digit, prints row twenty-one and sends
									; the text map
	jsr.w BCDTextAt
	ldx.w #mesarea
	ldy.w #$0015
	jsl.l PrintItalicRightStr
	ply
	jsl.l SendTextMap
	rts

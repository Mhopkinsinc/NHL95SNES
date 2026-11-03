DrawTradeRow:						; draws a row of the Trade Players lists: a player, his position and
									; rating
	ldy.b d2
	lda.w #$0010
	sta.l $7E24DC
	ldx.w #$49B8
	lda.b d4+2
	sec
	sbc.w $0002,y
	bmi .1
	stz.w RatingMode
	ldx.w #$4CF6
	sbc.w $0004,y
	bmi .1
	ldx.w #$4CF0
.1:									; A = $0000, if d2 = HomeRoster go to .2, A = $0064
	lda.w #$0000
	ldy.b d2
	cpy.w #HomeRoster
	beq .2
	lda.w #$0064
.2:									; A + d4+2, Y = A, A = ScratchBuf,y, if $0001 bits clear go to .3, ...
	clc
	adc.b d4+2
	tay
	lda.w ScratchBuf,y
	bit.w #$0001
	beq .3
	lda.w #$2400
	sta.b $D5
.3:									; $CF = $008C, $D1 = $00C8, Y = a2+2, call PrintBoldCentred, ...
	lda.w #$008C
	sta.b $CF
	lda.w #$00C8
	sta.b $D1
	ldy.b a2+2
	jsl.l PrintBoldCentred
	lda.b d4+2
	asl a
	adc.b d2
	tax
	lda.w $003A,x
	sta.b tmp0
	lsr a
	bcc .4
	clc
	adc.b tmp0
	tax
	lda.l SRPlayerTeams+1,x
	lsr a
	bra .5
.4:									; A + tmp0, X = A, A = SRPlayerTeams,x, A / 2, ...
	adc.b tmp0
	tax
	lda.l SRPlayerTeams,x
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
.5:									; A and $007F, X = A, A = BCDTable,x, A and $00FF, ...
	and.w #$007F
	tax
	lda.l BCDTable,x
	and.w #$00FF
	jsr.w BCDText
	lda.w #$0010
	sta.b $CF
	ldx.w #mesarea
	ldy.b a2+2
	jsl.l PrintBoldLeftStr
	lda.w #$0024
	sta.b $CF
	lda.b d4+2
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.b d2
	adc.w #$0118
	tax
	lda.w #$000C
	jsl.l FitNameToWorkBuf
	ldy.b a2+2
	jsl.l PrintBoldLeftStr
	lda.b d4+2
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.b d2
	tax
	lda.w $0110,x
	sta.w mesarea
	lda.w $0112,x
	sta.w mesarea+2
	lda.w $0114,x
	sta.w mesarea+4
	lda.w $0116,x
	sta.w mesarea+6
	jsr.w RecordOverall
	jsr.w BinToBCD
	jsr.w BCDText
	lda.w #$00C8
	sta.b $CF
	lda.w #$00F0
	sta.b $D1
	ldx.w #mesarea
	ldy.b a2+2
	jsl.l PrintBoldCentredStr
	lda.w #$2000
	sta.b $D5
	rts

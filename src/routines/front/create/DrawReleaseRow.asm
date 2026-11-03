DrawReleaseRow:						; draws row a3 of the Release Players list: a player, his position and
									; rating
	lda.w #$0010
	sta.l $7E24DC
	ldy.w #VisRoster
	ldx.w #$49B8
	lda.b a3
	sec
	sbc.w $0002,y
	bpl .1
	lda.b d0
	cmp.w #$0003
	bne .2
	bra .4
.1:									; RatingMode = 0, X = $4CF6, A - $0004,y, if the result >= 0 go to .3, ...
	stz.w RatingMode
	ldx.w #$4CF6
	sbc.w $0004,y
	bpl .3
	lda.b d0+2
	cmp.w #$000A
	bcs .4
.2:									; $D5 = $2C00, go to .4
	lda.w #$2C00
	sta.b $D5
	bra .4
.3:									; X = $4CF0, if d1 < $0007 go to .2
	ldx.w #$4CF0
	lda.b d1
	cmp.w #$0007
	bcc .2
.4:									; Y = a3, A = ScratchBuf,y, if $0001 bits clear go to .5, $D5 = $2400
	ldy.b a3
	lda.w ScratchBuf,y
	bit.w #$0001
	beq .5
	lda.w #$2400
	sta.b $D5
.5:									; $CF = $008C, $D1 = $00C8, Y = a2+2, call PrintBoldCentred, ...
	lda.w #$008C
	sta.b $CF
	lda.w #$00C8
	sta.b $D1
	ldy.b a2+2
	jsl.l PrintBoldCentred
	lda.b a3
	asl a
	adc.w #VisRoster
	tax
	lda.w $003A,x
	sta.b tmp0
	lsr a
	bcc .6
	clc
	adc.b tmp0
	tax
	lda.l SRPlayerTeams+1,x
	lsr a
	bra .7
.6:									; A + tmp0, X = A, A = SRPlayerTeams,x, A / 2, ...
	adc.b tmp0
	tax
	lda.l SRPlayerTeams,x
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
.7:									; A and $007F, X = A, A = BCDTable,x, A and $00FF, ...
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
	lda.b a3
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w #$331F
	tax
	lda.w #$000C
	jsl.l FitNameToWorkBuf
	ldy.b a2+2
	jsl.l PrintBoldLeftStr
	lda.b a3
	asl a
	asl a
	asl a
	asl a
	asl a
	tax
	lda.w VisRoster+272,x
	sta.w mesarea
	lda.w VisRoster+274,x
	sta.w mesarea+2
	lda.w VisRoster+276,x
	sta.w mesarea+4
	lda.w VisRoster+278,x
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

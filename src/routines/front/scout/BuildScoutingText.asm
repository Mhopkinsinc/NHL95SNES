BuildScoutingText:					; writes the scouting report's commentary into the text buffer: welcome to
									; a sold out ..., tonight's national hockey league game features the ...,
									; the hot and cold players
	jsl.l MarkWorkBuf
	stz.b d0+2
	ldx.w #TxtWelcomeToASoldOut&$FFFF
	jsr.w AppendScoutText
	lda.w HomeTeam
	asl a
	tax
	lda.l $C30000,x
	tax
	lda.l $C30002,x
	tax
	phx
	jsl.l SkipPackedTextLong
	jsl.l SkipPackedTextLong
	stx.b d0
	jsl.l SkipPackedTextLong
	jsr.w AppendScoutText
	ldx.w #TxtTonightsGameFeatures&$FFFF
	jsr.w AppendScoutText
	plx
	lda.w HomeTeam
	beq .1
	jsr.w AppendScoutText
.1:									; ScratchBuf,y = $0020, Y + 1, d0+2 = Y, X = d0, ...
	lda.w #$0020
	sta.w ScratchBuf,y
	iny
	sty.b d0+2
	ldx.b d0
	jsr.w AppendScoutText
	lda.w #$6120
	sta.w ScratchBuf,y
	lda.w #$646E
	sta.w ScratchBuf+$2,y
	lda.w #$2064
	sta.w ScratchBuf+$3,y
	iny
	iny
	iny
	iny
	iny
	sty.b d0+2
	lda.w VisTeam
	asl a
	tax
	lda.l $C30000,x
	tax
	lda.l $C30002,x
	tax
	phx
	jsl.l SkipPackedTextLong
	jsl.l SkipPackedTextLong
	stx.b d0
	plx
	lda.w VisTeam
	bne .2
	ldx.w #TxtThe&$FFFF
.2:									; call AppendScoutText, ScratchBuf,y = $0020, Y + 1, d0+2 = Y, ...
	jsr.w AppendScoutText
	lda.w #$0020
	sta.w ScratchBuf,y
	iny
	sty.b d0+2
	ldx.b d0
	jsr.w AppendScoutText
	lda.w #$203D
	sta.w ScratchBuf,y
	lda.w #$0039
	sta.w ScratchBuf+$2,y
	iny
	iny
	iny
	lda.w hotterteam
	cmp.w #$FFFF
	beq .4
	sty.b d0+2
	asl a
	tax
	lda.l $C30000,x
	tax
	lda.l $C30002,x
	tax
	jsr.w AppendScoutText
	ldx.w #TxtHasBeenPlaying&$FFFF
	jsr.w AppendScoutText
	lda.w hotterteam
	bpl .3
	lda.w #$7865
	sta.w ScratchBuf,y
	lda.w #$7274
	sta.w ScratchBuf+$2,y
	lda.w #$6D65
	sta.w ScratchBuf+$4,y
	lda.w #$6C65
	sta.w ScratchBuf+$6,y
	lda.w #$2079
	sta.w ScratchBuf+$8,y
	tya
	clc
	adc.w #$000A
	tay
.3:									; d0+2 = Y, X = TxtWellRecently&$FFFF, call AppendScoutText
	sty.b d0+2
	ldx.w #TxtWellRecently&$FFFF
	jsr.w AppendScoutText
.4:									; d0 = HomeRoster, A = HomeTeam, X = HomeHotCold, ...
	lda.w #HomeRoster
	sta.b d0
	lda.w HomeTeam
	ldx.w #HomeHotCold
	jsr.w AppendScoutHotColdParagraph
	lda.w #VisRoster
	sta.b d0
	lda.w VisTeam
	cmp.w HomeTeam
	beq .5
	ldx.w #VisHotCold
	jsr.w AppendScoutHotColdParagraph
.5:									; X = $4E27, call AppendScoutText, ScratchBuf,y = $0000, Y + 1, ...
	ldx.w #$4E27
	jsr.w AppendScoutText
	lda.w #$0000
	sta.w ScratchBuf,y
	iny
	iny
	sty.b d0+2
	jsl.l RestoreWorkBuf
	tya
	jsl.l AllocWorkBuf
	sta.b $7B
	tax
	jsl.l MarkWorkBuf
	ldy.w #$0000
	sep #$20
.loop:								; loop: $0000,x = ScratchBuf,y, X + 1, Y + 1, ...
	lda.w ScratchBuf,y
	sta.w $0000,x
	inx
	iny
	cpy.b d0+2
	bne .loop
	rep #$20
	rts

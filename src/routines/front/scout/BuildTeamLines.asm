BuildTeamLines:						; builds the line data of roster table Y from its players: each player's
									; value (RecordOverallLong), then the line slots filled position by
									; position
	sty.b tmp0
	stz.w RatingMode
	lda.w $0000,y
	sta.b tmp1
.loop:								; loop: if zero go to .1, A - 1, tmp1 = A, A * 2, ...
	beq .1
	dec a
	sta.b tmp1
	asl a
	tay
	asl a
	asl a
	asl a
	asl a
	adc.b tmp0
	tax
	lda.w $0110,x
	sta.w mesarea
	lda.w $0112,x
	sta.w mesarea+2
	lda.w $0114,x
	sta.w mesarea+4
	lda.w $0116,x
	sta.w mesarea+6
	jsl.l RecordOverallLong
	sta.w ScratchBuf,y
	lda.b tmp1
	sta.w ScratchBuf+$40,y
	bra .loop
.1:									; ScratchBuf+$80 = $FFFF, X = ScratchBuf+$80, Y = ScratchBuf+$82, ...
	lda.w #$FFFF
	sta.w ScratchBuf+$80
	ldx.w #ScratchBuf+$80
	ldy.w #ScratchBuf+$82
	lda.w #$00FD
	mvn $7E,$7E
	ldy.b tmp0
	clc
	lda.w $0002,y
	adc.w $0004,y
	dec a
	asl a
	tax
	lda.w $0004,y
	sta.b tmp1
	sta.b tmp3
.loop2:								; loop: call InsertRankedLineForward, X - 1, X - 1, tmp1 - 1, ...
	jsr.w InsertRankedLineForward
	dex
	dex
	dec.b tmp1
	bne .loop2
	ldy.b tmp0
	lda.w $0000,y
	dec a
	asl a
	tax
	lda.w $0006,y
	sta.b tmp1
	sta.b $0A
.loop3:								; loop: call InsertRankedLineDefenceman, X - 1, X - 1, tmp1 - 1, ...
	jsr.w InsertRankedLineDefenceman
	dex
	dex
	dec.b tmp1
	bne .loop3
	lda.w #$0001
	sta.w ScratchBuf+$180
	lda.w ScratchBuf+$100
	sta.w ScratchBuf+$181
	lda.w ScratchBuf+$102
	sta.w ScratchBuf+$182
	lda.w ScratchBuf+$82
	sta.w ScratchBuf+$183
	lda.w ScratchBuf+$80
	sta.w ScratchBuf+$184
	lda.w ScratchBuf+$84
	sta.w ScratchBuf+$185
	lda.w ScratchBuf+$86
	sta.w ScratchBuf+$186
	stz.w ScratchBuf+$187
	lda.w #$0007
	ldx.w #ScratchBuf+$180
	ldy.w #ScratchBuf+$188
	mvn $7E,$7E
	stz.b r0
	stz.b r0+2
	lda.w #$0005
	sta.b tmp1
	ldx.w #ScratchBuf+$188
	stx.b $14
	lda.w $0000,x
	and.w #$00FF
	jsr.w MarkLineDefencemanUsed
	lda.w $0001,x
	and.w #$00FF
	jsr.w MarkLineDefencemanUsed
	lda.w $0002,x
	and.w #$00FF
	jsr.w MarkLineForwardUsed
	lda.w $0003,x
	and.w #$00FF
	jsr.w MarkLineForwardUsed
	lda.w $0004,x
	and.w #$00FF
	jsr.w MarkLineForwardUsed
	lda.w $0005,x
	and.w #$00FF
	jsr.w MarkLineForwardUsed
.loop4:								; loop: A = $14, A + $0008, X = A, $14 = X
	lda.b $14
	clc
	adc.w #$0008
	tax
	stx.b $14
.loop5:								; loop: tmp2 = 0, A 8-bit, call PickUnusedLineDefenceman, ...
	stz.b tmp2
	sep #$20
	jsr.w PickUnusedLineDefenceman
	bcs .loop5
	sta.w $0001,x
	jsr.w MarkLineDefencemanUsed
	stz.b tmp2
	jsr.w PickUnusedLineDefenceman
	bcs .loop5
	sta.w $0002,x
	jsr.w MarkLineDefencemanUsed
	stz.b tmp2
	jsr.w PickUnusedLineForward
	bcs .loop5
	sta.w $0003,x
	jsr.w MarkLineForwardUsed
	stz.b tmp2
	jsr.w PickUnusedLineForward
	bcs .loop5
	sta.w $0004,x
	jsr.w MarkLineForwardUsed
	stz.b tmp2
	jsr.w PickUnusedLineForward
	bcs .loop5
	sta.w $0005,x
	jsr.w MarkLineForwardUsed
	stz.b tmp2
	jsr.w PickUnusedLineForward
	bcs .loop5
	sta.w $0006,x
	jsr.w MarkLineForwardUsed
	rep #$20
	lda.b $14
	dec.b tmp1
	bpl .loop4
	clc
	lda.b tmp0
	adc.w #$006C
	tay
	ldx.w #ScratchBuf+$180
	lda.w #$003F
	mvn $7E,$7E
	rts

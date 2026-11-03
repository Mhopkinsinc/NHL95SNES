DrawGameMarks:						; draws game d1+2 on the BG2 map at d3: a 9 x 2 tile bar in each team's
									; palette and a mark from WonCheckTiles picked by the day, SRDayPlayed and
									; the game's bit at SRUserGames
	jsl.l WaitTransfers
	phd
	lda.b d1+2
	lsr a
	ldx.w #$2801
	bcc .1
	ldx.w #$3001
.1:									; A = d3, A or $5000, Y = A, A = $2100, ...
	lda.b d3
	ora.w #$5000
	tay
	lda.w #$2100
	tcd
	lda.w #$0080
	sta.b VMAIN&$FF
	jsr.w WriteBlanks9
	jsr.w WriteTiles9
	jsr.w WriteTiles9
	jsr.w WriteBlanks9
	txa
	clc
	adc.w #$0400
	and.w #$FC00
	ora.w #$0001
	tax
	jsr.w WriteTiles9
	jsr.w WriteTiles9
	jsr.w WriteBlanks9
	tya
	sec
	sbc.w #$00E4
	and.w #$03FF
	ora.w #$5000
	tay
	lda.w d4
	clc
	adc.w d1+2
	pha
	and.w #$0007
	tax
	lda.l ByteBitMasks,x
	and.w #$00FF
	sta.w tmp0
	pla
	lsr a
	lsr a
	lsr a
	tax
	lda.l SeasonDay
	and.w #$00FF
	cmp.w d0
	beq .3
	bcc .4
	lda.l SRUserGames,x
	ldx.w #$3C33
	and.w tmp0
	beq .2
	jsr.w WriteBlanks4
	jsr.w WriteBlanks4
	jsr.w WriteBlanks4
	jsr.w WriteBlanks4
	jsr.w WriteTiles4
	jsr.w WriteTiles4
	jsr.w WriteBlanks4
	pld
	rts
.2:									; call WriteBlanks4, call WriteTiles4, call WriteTiles4, ...
	jsr.w WriteBlanks4
	jsr.w WriteTiles4
	jsr.w WriteTiles4
	jsr.w WriteBlanks4
	jsr.w WriteBlanks4
	jsr.w WriteBlanks4
	jsr.w WriteBlanks4
	pld
	rts
.3:									; push X, X = d1+2, A = SRDayPlayed
	phx
	ldx.w d1+2
	lda.l SRDayPlayed
.loop:								; loop: A / 2, X - 1, if the result >= 0 go to .loop, pull X, ...
	lsr a
	dex
	bpl .loop
	plx
	bcc .4
	jsr.w WriteBlanks4
	jsr.w WriteBlanks4
	jsr.w WriteBlanks4
	jsr.w WriteBlanks4
	jsr.w WriteBlanks4
	jsr.w WriteBlanks4
	jsr.w WriteBlanks4
	pld
	rts
.4:									; A = SRUserGames,x, X = $3C13, if the result is not 0 go to .5, X = $3C23
	lda.l SRUserGames,x
	ldx.w #$3C13
	and.w tmp0
	bne .5
	ldx.w #$3C23
.5:									; call WriteBlanks4, call WriteTiles4, call WriteTiles4, ...
	jsr.w WriteBlanks4
	jsr.w WriteTiles4
	jsr.w WriteTiles4
	jsr.w WriteTiles4
	jsr.w WriteTiles4
	jsr.w WriteBlanks4
	jsr.w WriteBlanks4
	pld
	rts

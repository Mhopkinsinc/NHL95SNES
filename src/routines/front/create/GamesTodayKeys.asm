GamesTodayKeys:						; Games Today step 0: left / right change the day d0, up / down the game
									; $85 (a scroll at the list's ends), B flips the game between user and
									; computer, start / select leave
	lda.w repeatdelayframes
	beq .1
	cmp.w #$0014
	bcc .rts
	lda.w #$0010
	sta.w repeatdelayframes
.1:									; A = padchangeany, if a $0200 bit set go to .6, ...
	lda.w padchangeany
	bit.w #$0200
	bne .6
	bit.w #$0100
	bne .7
	bit.w #$0800
	bne .8
	bit.w #$0400
	beq .2
	jmp.w .12
.2:									; if a $8000 bit set go to .3, if $3000 bits clear go to .rts, ...
	bit.w #$8000
	bne .3
	bit.w #$3000
	beq .rts
	jsl.l FadeOutWait
	jmp.w SeasonOptions
.rts:								; return
	rts
.3:									; A = SeasonDay, A and $00FF, if A = d0 go to .4, if carry set go to .rts
	lda.l SeasonDay
	and.w #$00FF
	cmp.b d0
	beq .4
	bcs .rts
.4:									; if not zero go to .5, X = d1+2, A = SRDayPlayed
	bne .5
	ldx.b d1+2
	lda.l SRDayPlayed
.loop:								; loop: A / 2, X - 1, if the result >= 0 go to .loop, ...
	lsr a
	dex
	bpl .loop
	bcs .rts
.5:									; A = d4, A + d1+2, push A, A and $0007, ...
	lda.b d4
	clc
	adc.b d1+2
	pha
	and.w #$0007
	tax
	lda.l ByteBitMasks,x
	and.w #$00FF
	sta.b tmp0
	pla
	lsr a
	lsr a
	lsr a
	tax
	lda.l SRUserGames,x
	eor.b tmp0
	sta.l SRUserGames,x
	jmp.w DrawGameMarks
.6:									; A = SeasonDay, A and $00FF, if A >= d0 go to .rts, d0 - 1, ...
	lda.l SeasonDay
	and.w #$00FF
	cmp.b d0
	bcs .rts
	dec.b d0
	jsr.w DrawDayGames
	jmp.w PrintGamesTodayDate
.7:									; A = d0, A * 2, X = A, if SeasonDates+2,x = 0 go to .rts, ...
	lda.b d0
	asl a
	tax
	lda.l SeasonDates+2,x
	beq .rts
	inc.b d0
	jsr.w DrawDayGames
	jmp.w PrintGamesTodayDate
.8:									; if d1+2 = 0 go to .rts, A - 1, d1+2 = A, if not zero go to .9, ...
	lda.b d1+2
	beq .rts
	dec a
	sta.b d1+2
	bne .9
	ldx.b a4
	lda.b $22,x
	and.w #$FFFE
	sta.b $22,x
.9:									; A = d3, A - $00E0, A and $03FF, d3 = A, ...
	sec
	lda.b d3
	sbc.w #$00E0
	and.w #$03FF
	sta.b d3
	ldx.b a0
	lda.b $08,x
	cmp.w #$0060
	beq .10
	lda.w #$0060
	sta.b $08,x
	rts
.10:								; X = $75, A = $22,x, A or $0001, $22,x = A, ...
	ldx.b $75
	lda.b $22,x
	ora.w #$0001
	sta.b $22,x
	jsr.w DrawGameInSlot
	lda.b d0+2
	dec a
	bpl .11
	lda.w #$0002
.11:								; d0+2 = A, d2+2 = $0002
	sta.b d0+2
	lda.w #$0002
	sta.b d2+2
.rts2:								; return
	rts
.12:								; A = d1+2, A + 1, if A >= d2 go to .rts2, d1+2 = A, ...
	lda.b d1+2
	inc a
	cmp.b d2
	bcs .rts2
	sta.b d1+2
	inc a
	cmp.b d2
	bcc .13
	ldx.b $75
	lda.b $22,x
	and.w #$FFFE
	sta.b $22,x
	clc
.13:								; A = d3, A + $00E0, A and $03FF, d3 = A, ...
	lda.b d3
	adc.w #$00E0
	and.w #$03FF
	sta.b d3
	ldx.b a0
	lda.b $08,x
	cmp.w #$0098
	beq .14
	lda.w #$0098
	sta.b $08,x
	rts
.14:								; X = a4, A = $22,x, A or $0001, $22,x = A, ...
	ldx.b a4
	lda.b $22,x
	ora.w #$0001
	sta.b $22,x
	jsr.w DrawGameInSlot
	lda.b d0+2
	inc a
	cmp.w #$0003
	bcc .15
	lda.w #$0000
.15:								; d0+2 = A, d2+2 = $0004, return
	sta.b d0+2
	lda.w #$0004
	sta.b d2+2
	rts

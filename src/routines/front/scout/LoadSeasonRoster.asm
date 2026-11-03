LoadSeasonRoster:					; builds team tmp0's roster table at tmp1 from the season data: each
									; player whose entry at SRPlayerTeams has team tmp0 (AddRosterPlayer),
									; then the entries ordered
	asl a
	tax
	lda.l $C30000,x
	tax
	adc.l $C30006,x
	tax
	jsr.w UnpackTeamBonuses
	tyx
	stz.w $0000,x
	stz.w $0002,x
	stz.w $0004,x
	stz.w $0006,x
	stz.b tmp2
	ldx.w #$0000
	ldy.b tmp1
.loop:								; loop: A = SRPlayerTeams,x, A and $001F, if A is not tmp0 go to .1, ...
	lda.l SRPlayerTeams,x
	and.w #$001F
	cmp.b tmp0
	bne .1
	jsr.w AddRosterPlayer
.1:									; A = tmp2, A + 1, if A >= $027E go to .3, tmp2 = A, ...
	lda.b tmp2
	inc a
	cmp.w #$027E
	bcs .3
	sta.b tmp2
	lda.l SRPlayerTeams+1,x
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$001F
	cmp.b tmp0
	bne .2
	jsr.w AddRosterPlayer
.2:									; X + 1, X + 1, X + 1, A = tmp2, ...
	inx
	inx
	inx
	lda.b tmp2
	inc a
	sta.b tmp2
	cmp.w #$027E
	bcc .loop
.3:									; tmp2 = (tmp1), Y = tmp1
	lda.b (tmp1)
	sta.b tmp2
	ldy.b tmp1
.4:									; if $003A,y < $026A go to .5, push Y, call CreatedPlayerBits, ...
	lda.w $003A,y
	cmp.w #$026A
	bcc .5
	phy
	jsr.w CreatedPlayerBits
	jsr.w NextSaveBits3
	ply
	cmp.w #$0000
	bne .7
	pea.w $0000
	bra .6
.5:									; A * 2, X = A, A = PlayerList,x, if a $C000 bit set go to .7, ...
	asl a
	tax
	lda.l PlayerList,x
	bit.w #$C000
	bne .7
	pea.w $0000
.6:									; X = tmp1, A = $0002,x, $0002,x + 1, A * 2, ...
	ldx.b tmp1
	lda.w $0002,x
	inc.w $0002,x
	asl a
	adc.b tmp1
	tax
	jsr.w SwapRosterPlayers
	plx
	bra .7
.7:									; Y + 1, Y + 1, tmp2 - 1, if the result is not 0 go to .4, ...
	iny
	iny
	dec.b tmp2
	bne .4
	lda.b (tmp1)
	sta.b tmp2
	ldy.b tmp1
.8:									; if $003A,y < $026A go to .9, push Y, call CreatedPlayerBits, ...
	lda.w $003A,y
	cmp.w #$026A
	bcc .9
	phy
	jsr.w CreatedPlayerBits
	jsr.w NextSaveBits3
	ply
	cmp.w #$0003
	bcc .11
	bra .10
.9:									; A * 2, X = A, if PlayerList,x >= 0 go to .11
	asl a
	tax
	lda.l PlayerList,x
	bpl .11
.10:								; X = tmp1, A = $0004,x, $0004,x + 1, A + $0002,x, ...
	ldx.b tmp1
	lda.w $0004,x
	inc.w $0004,x
	clc
	adc.w $0002,x
	asl a
	adc.b tmp1
	tax
	jsr.w SwapRosterPlayers
.11:								; Y + 1, Y + 1, tmp2 - 1, if the result is not 0 go to .8, ...
	iny
	iny
	dec.b tmp2
	bne .8
	ldx.b tmp1
	lda.w $0000,x
	sec
	sbc.w $0002,x
	sbc.w $0004,x
	sta.w $0006,x
	rts

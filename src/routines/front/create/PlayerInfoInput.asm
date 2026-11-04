PlayerInfoInput:					; EditPlayerInfo's keys: up / down pick line d6 (position, weight, number,
									; hand), left / right its routine (PlayerInfoLeft / PlayerInfoRight),
									; start the ratings page, X cancels
	lda.w repeatdelayframes
	beq .1
	cmp.w #$0014
	bcc .rts
	lda.w #$000F
	sta.w repeatdelayframes
.1:									; A = padchangeany, if a $1000 bit set go to .8, ...
	lda.w padchangeany
	bit.w #$1000
	bne .8
	bit.w #$0800
	bne .4
	bit.w #$0400
	bne .6
	bit.w #$0040
	beq .2
	jmp.w ExitCreatePlayer2
.2:									; if $0200 bits clear go to .3, A = d6, A * 2, X = A, ...
	bit.w #$0200
	beq .3
	lda.b d6
	asl a
	tax
	jsr (PlayerInfoLeft,x)
	lda.w padchangeany
.3:									; if $0100 bits clear go to .rts, A = d6, A * 2, X = A, ...
	bit.w #$0100
	beq .rts
	lda.b d6
	asl a
	tax
	jsr (PlayerInfoRight,x)
.rts:								; return
	rts
.4:									; A = d6, A * 2, A + d6, A + $0008, ...
	lda.b d6
	asl a
	adc.b d6
	adc.w #$0008
	jsr.w SetRowPalette3
	lda.b d6
	dec a
	bpl .5
	lda.w #$0003
.5:									; d6 = A, A * 2, A + d6, A + $0008, ...
	sta.b d6
	asl a
	adc.b d6
	adc.w #$0008
	jmp.w SetRowPalette0
.6:									; A = d6, A * 2, A + d6, A + $0008, ...
	lda.b d6
	asl a
	adc.b d6
	adc.w #$0008
	jsr.w SetRowPalette3
	lda.b d6
	inc a
	cmp.w #$0004
	bcc .7
	lda.w #$0000
.7:									; d6 = A, A * 2, A + d6, A + $0008, ...
	sta.b d6
	asl a
	adc.b d6
	adc.w #$0008
	jmp.w SetRowPalette0
.8:									; call FadeOutWait, A = $D3, A + $0180, Y = $0580, ...
	jsl.l FadeOutWait
	clc
	lda.b $D3
	adc.w #$0180
	ldy.w #$0580
	jsl.l ClearRAM7E
	ldy.w #$5C00
	jsl.l ClearVRAM
	lda.w #CreateGoalieRatingsPage&$FFFF
	ldx.b d0
	beq .9
	lda.w #CreateSkaterRatingsPage&$FFFF
.9:									; call PrintTextPage, call WaitTransfers, X = a0, A = $0003, ...
	jsl.l PrintTextPage
	jsl.l WaitTransfers
	ldx.b a0
	lda.w #$0003
	jsl.l SetSpriteAnim
	lda.b $36,x
	and.w #$BFFF
	sta.b $36,x
	inc.b d6+2
	stz.b d6
	lda.w #$0145
	sta.b d2
	lda.w #$0003
	sta.w CreateRatings
	lda.w #$0027
	ldx.w #CreateRatings
	ldy.w #CreateRatings+2
	mvn $7E,$7E
	lda.w #$00E8
	sta.b $D1
	ldx.w #$0010
	ldy.w #$0008
	lda.b d0
	beq .10
	ldx.w #$0016
	dey
.10:								; tmp0 = X, X = $0000
	stx.b tmp0
	ldx.w #$0000
.loop:								; loop: A = CreateRatings,x, push X, push Y, tmp1 = A, ...
	lda.w CreateRatings,x
	phx
	phy
	sta.b tmp1
	asl a
	asl a
	adc.b tmp1
	adc.w #$0019
	jsr.w BinToBCD
	jsr.w BCDText
	ldx.w #mesarea
	jsl.l PrintBoldRightStr
	ply
	plx
	iny
	inx
	inx
	cpx.b tmp0
	bcc .loop
	jsr.w PrintCreatedOverall
	lda.w #$0008
.loop2:								; loop: push A, call SetRowPalette3, pull A, A + 1, ...
	pha
	jsr.w SetRowPalette3
	pla
	inc a
	inc a
	cmp.w #$0014
	bcc .loop2
	jsl.l SendTextMap
	jsl.l WaitTransfers
	stz.w fadein
	rts

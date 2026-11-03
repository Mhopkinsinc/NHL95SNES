DrawPlayerTags:						; for each pad's controlled player (PadControlObj), sprite tags near him
									; straight into the OAM buffer: his two roster number digits (tiles from
									; $2436) and a marker
	dec.b QueueBusy
	tsc
	sta.b $1C
	lda.b $28
	tcs
	ldy.w #$000C
DrawPadTag:							; pad Y's tag ($0F: none): the player's screen spot, then his roster
									; number digits through PutTagChar
	sty.b $10
	lda.w PadControlObj,y
	cmp.w #$000F
	bne .1
	jmp.w NextPadTag
.1:									; A * 2, X = A, A = Xpos,x, A + $0074, ...
	php
	asl a
	tax
	lda.w Xpos,x
	adc.w #$0074
	sec
	sbc.b Hpos
	sta.b $0A
	sec
	lda.b Vpos
	sbc.w Ypos,x
	clc
	adc.w #$006A
	sta.b $0C
	plp
	bcc .2
	jmp.w TagReplayPoint
.2:									; A = position,x, A and $0007, A * 2, $0E = A, ...
	lda.w position,x
	and.w #$0007
	asl a
	sta.b $0E
	bne .3
	lda.b $0A
	adc.w #$0004
	sta.b $0A
.3:									; A = rostnum,x, X = A, A and $00F0, A / 2, ...
	lda.w rostnum,x
	tax
	and.w #$00F0
	lsr a
	lsr a
	lsr a
	lsr a
	adc.w #$2436
	sta.b tmp1
	txa
	and.w #$000F
	adc.w #$2436
	sta.b tmp2
	lda.w #TagSecondDigit
	sta.b tmp3
	jmp.w PutTagChar

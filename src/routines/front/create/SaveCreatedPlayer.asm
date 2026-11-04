SaveCreatedPlayer:					; saves the created player in the first free one of 20 save RAM slots ($9C
									; bits each, free when the first letter is 0): its entry at SRPlayerTeams,
									; both names at 5 bits a letter, the ratings, then GameSetUp
	lda.w #$026A
	sta.b tmp3
	ldy.w #$0003
.loop:								; loop: call ReadSaveBits5, if A = $0000 go to .1, tmp3 + 1, A = Y, ...
	jsr.w ReadSaveBits5
	cmp.w #$0000
	beq .1
	inc.b tmp3
	clc
	tya
	adc.w #$009C
	tay
	cpy.w #$0C30
	bcc .loop
	jmp.w ExitCreatePlayer3
.1:									; A = Y, A - $0003, Y = A, tmp1 = A, ...
	tya
	sec
	sbc.w #$0003
	tay
	sta.b tmp1
	sta.b r2
	lda.w #$000D
	sta.b r1
	jsl.l Div16U
	clc
	lda.b r0
	adc.w #$1CF8
	sta.b r0
	lsr a
	lsr a
	lsr a
	tax
	lda.b d1
	xba
	lsr a
	lsr a
	lsr a
	sta.b tmp0
	lda.b r0
	and.w #$0007
	beq .2
	lda.b d1
	xba
	asl a
	sta.b tmp0
	lda.l SRPlayerTeams,x
	and.w #$000F
	ora.w #$01A0
	bra .3
.2:									; A = SRPlayerTeams,x, A and $F000, A or $001A
	lda.l SRPlayerTeams,x
	and.w #$F000
	ora.w #$001A
.3:									; A or tmp0, SRPlayerTeams,x = A, Y = tmp1, tmp2 = d0, ...
	ora.b tmp0
	sta.l SRPlayerTeams,x
	ldy.b tmp1
	lda.b d0
	sta.b tmp2
	jsr.w WriteSaveBits3
	ldx.w #$0000
.loop2:								; loop: A = CreateFirstName+1,x, if the result = 0 go to .5, ...
	lda.w CreateFirstName+1,x
	and.w #$00FF
	beq .5
	cmp.w #$003D
	bne .4
	lda.w #$001D
.4:									; push X, tmp2 = A, call WriteSaveBits5, pull X, ...
	phx
	sta.b tmp2
	jsr.w WriteSaveBits5
	plx
	inx
	cpx.w #$0008
	bcc .loop2
.5:									; if X >= $0008 go to .6, tmp2 = 0, call WriteSaveBits5
	cpx.w #$0008
	bcs .6
	stz.b tmp2
	jsr.w WriteSaveBits5
.6:									; A = tmp1, A + $002B, Y = A, X = $0000
	clc
	lda.b tmp1
	adc.w #$002B
	tay
	ldx.w #$0000
.loop3:								; loop: A = CreateLastName+1,x, if the result = 0 go to .8, ...
	lda.w CreateLastName+1,x
	and.w #$00FF
	beq .8
	cmp.w #$003D
	bne .7
	lda.w #$001D
.7:									; push X, tmp2 = A, call WriteSaveBits5, pull X, ...
	phx
	sta.b tmp2
	jsr.w WriteSaveBits5
	plx
	inx
	cpx.w #$000A
	bcc .loop3
.8:									; if X >= $000A go to .9, tmp2 = 0, call WriteSaveBits5
	cpx.w #$000A
	bcs .9
	stz.b tmp2
	jsr.w WriteSaveBits5
.9:									; A = tmp1, A + $005D, Y = A, tmp2 = d1, ...
	clc
	lda.b tmp1
	adc.w #$005D
	tay
	lda.b d1
	sta.b tmp2
	jsr.w WriteSaveBits7
	lda.b d0
	bne .10
	jmp.w .11
.10:								; A = CreateRatings+$2, call RatingNibble, tmp2 = A, ...
	lda.w CreateRatings+$2
	jsr.w RatingNibble
	sta.b tmp2
	jsr.w WriteSaveBits4
	lda.b d0+2
	sta.b tmp2
	jsr.w WriteSaveBits4
	lda.w CreateRatings+$6
	jsr.w RatingNibble
	sta.b tmp2
	jsr.w WriteSaveBits4
	lda.w CreateRatings
	jsr.w RatingNibble
	sta.b tmp2
	jsr.w WriteSaveBits4
	lda.w CreateRatings+$C
	jsr.w RatingNibble
	sta.b tmp2
	jsr.w WriteSaveBits4
	lda.w CreateRatings+$8
	jsr.w RatingNibble
	sta.b tmp2
	jsr.w WriteSaveBits4
	lda.b d1+2
	sta.b tmp2
	jsr.w WriteSaveBit
	lda.w CreateRatings+$16
	jsr.w RatingNibble
	lsr a
	sta.b tmp2
	jsr.w WriteSaveBits3
	lda.w CreateRatings+$14
	jsr.w RatingNibble
	sta.b tmp2
	jsr.w WriteSaveBits4
	lda.w CreateRatings+$E
	jsr.w RatingNibble
	sta.b tmp2
	jsr.w WriteSaveBits4
	lda.w CreateRatings+$A
	jsr.w RatingNibble
	sta.b tmp2
	jsr.w WriteSaveBits4
	lda.b $26
	sta.b tmp2
	jsr.w WriteSaveBits4
	lda.w CreateRatings+$4
	jsr.w RatingNibble
	sta.b tmp2
	jsr.w WriteSaveBits4
	lda.w CreateRatings+$12
	jsr.w RatingNibble
	sta.b tmp2
	jsr.w WriteSaveBits4
	lda.w CreateRatings+$10
	jsr.w RatingNibble
	sta.b tmp2
	jsr.w WriteSaveBits4
	lda.b tmp3
	jsr.w ClearPlayerGoals
	jmp.w ExitCreatePlayer3
.11:								; A = CreateRatings+$2, call RatingNibble, tmp2 = A, ...
	lda.w CreateRatings+$2
	jsr.w RatingNibble
	sta.b tmp2
	jsr.w WriteSaveBits4
	lda.b d0+2
	sta.b tmp2
	jsr.w WriteSaveBits4
	stz.b tmp2
	jsr.w WriteSaveBits4
	lda.w CreateRatings
	jsr.w RatingNibble
	sta.b tmp2
	jsr.w WriteSaveBits4
	lda.w CreateRatings+$6
	jsr.w RatingNibble
	sta.b tmp2
	jsr.w WriteSaveBits4
	lda.w CreateRatings+$4
	jsr.w RatingNibble
	sta.b tmp2
	jsr.w WriteSaveBits4
	lda.b d1+2
	sta.b tmp2
	jsr.w WriteSaveBits4
	stz.b tmp2
	jsr.w WriteSaveBits4
	stz.b tmp2
	jsr.w WriteSaveBits4
	jsr.w WriteSaveBits4
	lda.w CreateRatings+$8
	jsr.w RatingNibble
	sta.b tmp2
	jsr.w WriteSaveBits4
	lda.w CreateRatings+$A
	jsr.w RatingNibble
	sta.b tmp2
	jsr.w WriteSaveBits4
	lda.w CreateRatings+$C
	jsr.w RatingNibble
	sta.b tmp2
	jsr.w WriteSaveBits4
	lda.w CreateRatings+$E
	jsr.w RatingNibble
	sta.b tmp2
	jsr.w WriteSaveBits4
ExitCreatePlayer3:					; ExitCreatePlayer with two more return addresses pulled;
									; SaveCreatedPlayer ends here
	pla
ExitCreatePlayer2:					; ExitCreatePlayer with one more return address pulled
	pla
ExitCreatePlayer:					; leaves Create Player for the setup screen: a state handler's return
									; address pulled, then GameSetUp
	pla
	jmp.w GameSetUp

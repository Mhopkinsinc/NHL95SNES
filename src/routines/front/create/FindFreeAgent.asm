FindFreeAgent:						; A = the player index of free agent $65 (counting the players whose team
									; in SRPlayerTeams is $1A)
	ldx.w #$0000
	txy
.loop:								; loop: A = SRPlayerTeams,x, A and $001F, if A is not $001A go to .1, ...
	lda.l SRPlayerTeams,x
	and.w #$001F
	cmp.w #$001A
	bne .1
	dec.b a0+2
	bmi .3
.1:									; Y + 1, if Y >= $027E go to .3, A = SRPlayerTeams+1,x, A / 2, ...
	iny
	cpy.w #$027E
	bcs .3
	lda.l SRPlayerTeams+1,x
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$001F
	cmp.w #$001A
	bne .2
	dec.b a0+2
	bmi .3
.2:									; X + 1, X + 1, X + 1, Y + 1, ...
	inx
	inx
	inx
	iny
	cpy.w #$027E
	bcc .loop
.3:									; A = Y, return
	tya
	rts

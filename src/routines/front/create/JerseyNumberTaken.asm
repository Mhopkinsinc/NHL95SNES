JerseyNumberTaken:					; carry set when a player of VisTeam in SRPlayerTeams already has number
									; tmp2 (tmp1 = VisTeam * 16)
	ldx.w #$0000
	txy
.loop:								; loop: A = SRPlayerTeams,x, A and $001F, ...
	lda.l SRPlayerTeams,x
	and.w #$001F
	cmp.w VisTeam
	bne .1
	lda.l SRPlayerTeams,x
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$007F
	cmp.b tmp2
	beq .4
.1:									; Y + 1, if Y >= $027E go to .3, A = SRPlayerTeams+1,x, A and $01F0, ...
	iny
	cpy.w #$027E
	bcs .3
	lda.l SRPlayerTeams+1,x
	and.w #$01F0
	cmp.b tmp1
	bne .2
	lda.l SRPlayerTeams+2,x
	lsr a
	and.w #$007F
	cmp.b tmp2
	beq .4
.2:									; X + 1, X + 1, X + 1, Y + 1, ...
	inx
	inx
	inx
	iny
	cpy.w #$027E
	bcc .loop
.3:									; return
	clc
	rts
.4:									; return
	sec
	rts

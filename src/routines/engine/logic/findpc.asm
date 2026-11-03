findpc:								; from FaceoffPads and other segments
	pei ($7F)
	pei ($81)
	pei ($83)
	pei ($85)
	pei ($87)
	pei ($89)
	pei ($8B)
	pei ($8D)
	lda.w #$0008
	sta.b r0
	ldy.w puckc
	bra findpcSearch
.1:									; unreached: 94S findpc's puck carrier test (a goalie, a player with no
									; pad, a locked one or one $28 or more from the puck goes to .2, else
									; findpcSweepcheck); 95 branches past it to findpcSearch
	lda.w position,x
	beq .2
	lda.w playerpad,x
	bmi .2
	lda.w pfalock,x
	bne .2
	lda.w puckdist,x
	cmp.w #$0028
	bcs .2
	jmp.w findpcSweepcheck
.2:									; if playerpad,y < 0 go to .3, Y = A, ...
	lda.w playerpad,y
	bmi .3
	tay
	lda.w padside,y
	cmp.w padside,x
	beq findpcSearch
.3:									; Y = $0000, if pfgoal,x is not 0 go to .4, Y = $0004
	ldy.w #$0000
	lda.w pfgoal,x
	bne .4
	ldy.w #$0004
.4:									; r0 = Y
	sty.b r0
findpcSearch:						; searches the pad team for the eligible skater with the lowest distance
									; and direction cost
	lda.w #$0006
	sta.b d1
	ldy.b d4
	lda.w #$FFFF
	sta.b d2
	ldx.w #$0000
	lda.w cont1team,y
	cmp.w #$0001
	beq .loop
	ldx.w #$000C
.loop:								; loop: if position,x < 0 go to .4, if zero go to .4, A = pflags,x, ...
	lda.w position,x
	bmi .4
	beq .4
	lda.w pflags,x
	bit.w #$1000
	bne .4
	lda.w SPA,x
	cmp.w #SPAcrosscheck&$FFFF
	bcc .1
	cmp.w #$21BD
	bcc .2
.1:									; A = pflags,x, A and $1000, if the result is not 0 go to .4
	lda.w pflags,x
	and.w #$1000
	ora.w pfalock,x
	bne .4
.2:									; if playerpad,x < 0 go to .3, if playerpad,x is not d4 go to .4
	lda.w playerpad,x
	bmi .3
	cmp.b d4
	bne .4
.3:									; r3 = 0, if puckdist,x >= d2 go to .4, d3 = X, d2 = A
	stz.b r3
	lda.w puckdist,x
	cmp.b d2
	bcs .4
	stx.b d3
	sta.b d2
.4:									; X + 1, X + 1, d1 - 1, if the result is not 0 go to .loop, ...
	inx
	inx
	dec.b d1
	bne .loop
	ldx.b a3
	lda.b d2
	cmp.w #$FFFF
	beq findpcReturn
	ldy.b d4
	lda.b d3
	cmp.w c1playernum,y
	bne findpcAssign
findpcSweepcheck:					; runs Sweepcheck for the current player unless animation locked,
									; preserving scratch registers
	lda.w pfalock,x
	bne findpcReturn
	pei ($8F)
	pei ($91)
	pei ($93)
	pei ($95)
	pei ($97)
	pei ($99)
	pei ($63)
	pei ($65)
	pei ($67)
	pei ($69)
	jsl.l Sweepcheck
	pla
	sta.b a1+2
	pla
	sta.b a1
	pla
	sta.b a0+2
	pla
	sta.b a0
	pla
	sta.b d6+2
	pla
	sta.b d6
	pla
	sta.b d5+2
	pla
	sta.b d5
	pla
	sta.b d4+2
	pla
	sta.b d4
	bra findpcReturn

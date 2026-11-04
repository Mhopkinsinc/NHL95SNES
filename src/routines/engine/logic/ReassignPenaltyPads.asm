ReassignPenaltyPads:				; reassign team controllers when a player leaves for the penalty box
	ldy.b a2
	lda.w teampads,y
	cmp.w #$0004
	bcc .2
	sta.b d1
	lda.w #$0006
	sta.b d0
	lda.w tmsort,y
	tax
	ldy.w #$0000
.loop:								; loop: if position,x < 0 go to .1, if zero go to .1, Y + 1
	lda.w position,x
	bmi .1
	beq .1
	iny
.1:									; X + 1, X + 1, d0 - 1, if the result is not 0 go to .loop, ...
	inx
	inx
	dec.b d0
	bne .loop
	cpy.b d1
	beq .4
	bcc .4
.2:									; X = curobj, if playerpad,x >= 0 go to .3, go to PenaltyPadReturn
	ldx.b curobj
	lda.w playerpad,x
	bpl .3
	jmp.w PenaltyPadReturn
.3:									; d4 = A, call PassPadToTeammate, return
	sta.b d4
	jsl.l PassPadToTeammate
	rtl
.4:									; if Y is not $0003 go to .6, X = a2, Y = padsitnext,x
	cpy.w #$0003
	bne .6
	ldx.b a2
	ldy.w padsitnext,x
.loop2:								; loop: Y + 1, Y + 1, if Y is not $000A go to .5, Y = $0000
	iny
	iny
	cpy.w #$000A
	bne .5
	ldy.w #$0000
.5:									; if padside,y >= 0 go to .loop2, A and $00FF, ...
	lda.w padside,y
	bpl .loop2
	and.w #$00FF
	cmp.b a2
	bne .loop2
	sta.w padside,y
	inc a
	inc a
	lsr a
	sta.w cont1team,y
.6:									; X = a2, Y = padsitnext,x, go to .7
	ldx.b a2
	ldy.w padsitnext,x
	bra .7
.loop3:								; loop: Y + 1, Y + 1, if Y is not $000A go to .7, Y = $0000
	iny
	iny
	cpy.w #$000A
	bne .7
	ldy.w #$0000
.7:									; if padside,y is not a2 go to .loop3, A or $FF00, padside,y = A, ...
	lda.w padside,y
	cmp.b a2
	bne .loop3
	ora.w #$FF00
	sta.w padside,y
	lda.w #$0000
	sta.w cont1team,y
	phy
	iny
	iny
	cpy.w #$000A
	bne .8
	ldy.w #$0000
.8:									; A = Y, padsitnext,x = A, pull Y, X = c1playernum,y, ...
	tya
	sta.w padsitnext,x
	ply
	ldx.w c1playernum,y
	lda.w #$FFFF
	sta.w c1playernum,y
	sta.w playerpad,x
	jmp.w .2

PrintTradedPlayers:					; prints the chosen players of a trade list (bit 0 of each entry): No
									; Selections when none, Etc. after 8
	sty.b a2+2
	stx.b tmp0
	sta.b tmp1
	ldx.w #$0000
	txy
.loop:								; loop: A = (tmp1),y, if $0001 bits clear go to .1, X + 1
	lda.b (tmp1),y
	bit.w #$0001
	beq .1
	inx
.1:									; Y + 1, if Y is not tmp0 go to .loop, if X is not $0000 go to .2, ...
	iny
	cpy.b tmp0
	bne .loop
	cpx.w #$0000
	bne .2
	ldx.w #TxtNoSelections&$FFFF
	ldy.b a2+2
	jsl.l PrintBoldLeft
	rts
.2:									; tmp0 = X, tmp2 = 0, Y = $0000
	stx.b tmp0
	stz.b tmp2
	ldy.w #$0000
.loop2:								; loop: A = (tmp1),y, Y + 1, if $0001 bits clear go to .loop2, push Y, ...
	lda.b (tmp1),y
	iny
	bit.w #$0001
	beq .loop2
	phy
	dey
	tya
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.b d2
	adc.w #$0118
	tax
	lda.w #$000C
	jsl.l FitNameToWorkBuf
	ldy.b a2+2
	jsl.l PrintBoldLeftStr
	inc.b a2+2
	ply
	lda.b tmp2
	inc a
	sta.b tmp2
	cmp.b tmp0
	bne .3
	rts
.3:									; if A is not $0008 go to .loop2, A + 1, if A = tmp0 go to .loop2, ...
	cmp.w #$0008
	bne .loop2
	inc a
	cmp.b tmp0
	beq .loop2
	ldx.w #TxtEtc&$FFFF
	ldy.b a2+2
	jsl.l PrintBoldLeft
	rts

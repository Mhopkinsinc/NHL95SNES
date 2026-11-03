PutTagChar:							; writes one 8 x 8 tag sprite (tile tmp1) at screen x $0A, y $0C into the
									; OAM buffer (skipped off screen), then on to the continuation in tmp3
	ldy.b $2A
	pei ($A1)
	ldx.w #$0000
	lda.b $0A
	bpl .1
	cmp.w #$FFF9
	bcc .2
	inx
	and.w #$00FF
.1:									; if A >= $0100 go to .2, tmp0 = A, if $0C >= 0 go to .3, ...
	cmp.w #$0100
	bcs .2
	sta.b tmp0
	lda.b $0C
	bpl .3
	cmp.w #$FFF9
	and.w #$00FF
	bcs .4
.2:									; pull A, go to .5
	pla
	bra .5
.3:									; if A >= $00E0 go to .2
	cmp.w #$00E0
	bcs .2
.4:									; A or tmp0, push A, $00,y = X, Y + 1
	xba
	ora.b tmp0
	pha
	stx.b $00,y
	iny
.5:									; $2A = Y, jump through $00A5
	sty.b $2A
	jmp ($00A5)

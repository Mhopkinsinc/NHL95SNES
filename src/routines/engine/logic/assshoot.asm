assshoot:							; assignment (asstab entry 19): computer shooting, wind up then shoot
	lda.w pflags,x
	bit.w #$0002
	beq .1
	and.w #$FFFD
	sta.w pflags,x
	bra SetShotMode
.1:									; A = sflags, if a $0008 bit set go to .2, go to assexit
	lda.w sflags
	bit.w #$0008
	bne .2
	jmp.w assexit
.2:									; d0 = temp1,x, d2 = 0, A = temp2b,x, A - d7, ...
	lda.w temp1,x
	sta.b d0
	stz.b d2
	lda.w temp2b,x
	sec
	sbc.b d7
	sta.w temp2b,x
	bpl ShotMode
	lda.w #$0080
	tsb.b d2
ShotMode:							; shot input for the puck carrier: doshot at animation frame $18, the pad
									; direction to passdir, passspeed counted up
	cpx.w puckc
	bne .2
	lda.w SPA,x
	cmp.w #SPAshotf&$FFFF
	bcc .2
	cmp.w #$1EFB
	bcs .2
	lda.w SPAnum,x
	cmp.w #$0018
	bcs doshot
	lda.b d0
	bit.w #$0008
	bne .1
	and.w #$0007
	sta.w passdir
.1:									; if SPAnum,x >= $0010 go to .rtl, A = passspeed, A + d7, ...
	lda.w SPAnum,x
	cmp.w #$0010
	bcs .rtl
	lda.w passspeed
	clc
	adc.b d7
	sta.w passspeed
	lda.b d2
	bit.w #$0080
	beq .rtl
	lda.w #$001C
	sec
	sbc.w SPAnum,x
	sta.w SPAnum,x
	cmp.w #$0018
	bcc .rtl
	lda.w #$0018
	sta.w SPAnum,x
	bra doshot
.2:									; A = $0008
	lda.w #$0008
	trb.w sflags
.rtl:								; return
	rtl

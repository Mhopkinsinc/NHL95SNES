PushNumberWrap:						; a1 = d0 as d1 digits right-aligned after spaces in a buffer behind a
									; length word d1 + 2 (d0 mod 100 when d1 is 2); the digits are values 0-9
	phx
	ldy.b d1
	lda.b d0
	cpy.w #$0002
	bne .1
.loop:								; loop: if A < $0064 go to .1, A - $0064, go to .loop
	cmp.w #$0064
	bcc .1
	sbc.w #$0064
	bra .loop
.1:									; Y + 1, Y + 1, PushWidthBuf = Y, Y - 1, ...
	iny
	iny
	sty.w PushWidthBuf
	dey
	ldx.w #$2020
	stx.w PushWidthBuf+2
	stx.w PushWidthBuf+4
	stx.w PushWidthBuf+6
	stx.w PushWidthBuf+8
	ldx.w #$000A
	stx.b r1
.loop2:								; loop: r2 = A, call Div16x8U, A = RDMPYL, Y - 1, ...
	sta.b r2
	jsl.l Div16x8U
	lda.l RDMPYL
	xba
	dey
	sta.w PushWidthBuf,y
	lda.b r0
	bne .loop2
	ldx.w #PushWidthBuf
	stx.b a1
	ldx.w #$0000
	stx.b a1+2
	plx
	rtl

Sroot:								; no caller found (not traced)
	phx
	lda.b d0+2
	beq .7
	ldx.w #$0100
	ldy.w #$1000
	cmp.w #$0048
	bcs .2
	ldy.w #$087D
	cmp.w #$0016
	bcs .1
	ldy.w #$04B1
	bra .4
.1:									; X = $04B0, go to .4
	ldx.w #$04B0
	bra .4
.2:									; X = $087C, if A >= $0096 go to .3, Y = $0C40, go to .4
	ldx.w #$087C
	cmp.w #$0096
	bcs .3
	ldy.w #$0C40
	bra .4
.3:									; X = $0C3F
	ldx.w #$0C3F
.4:									; p0 = X, p1 = Y
	stx.b p0
	sty.b p1
.loop:								; loop: A = p0, A + p1, if A = p0 go to .6, push A, ...
	lda.b p0
	clc
	adc.b p1
	ror a
	cmp.b p0
	beq .6
	pha
	tax
	jsl.l Mul16U
	lda.b d0
	cmp.b r2
	lda.b d0+2
	sbc.b r2+2
	bcs .5
	pla
	sta.b p1
	bra .loop
.5:									; pull A, p0 = A, go to .loop
	pla
	sta.b p0
	bra .loop
.6:									; pull X, d0 = A, return
	plx
	sta.b d0
	rtl
.7:									; p0 = 0, p1 = $00FF
	stz.b p0
	lda.w #$00FF
	sta.b p1
.loop2:								; loop: A = p0, A + p1, if A = p0 go to .9, push A, ...
	lda.b p0
	clc
	adc.b p1
	ror a
	cmp.b p0
	beq .9
	pha
	and.w #$00FF
	asl a
	tax
	lda.l SquareTable,x
	cmp.b d0
	bcc .8
	pla
	sta.b p1
	bra .loop2
.8:									; pull A, p0 = A, go to .loop2
	pla
	sta.b p0
	bra .loop2
.9:									; pull X, d0 = A, return
	plx
	sta.b d0
	rtl

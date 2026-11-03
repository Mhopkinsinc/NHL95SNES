setpersonel:						; from chk4lc, lcfound and other segments
	pei ($7F)
	pei ($81)
	pei ($83)
	pei ($85)
	pei ($87)
	pei ($89)
	pei ($8B)
	pei ($8D)
	pei ($8F)
	pei ($91)
	pei ($93)
	pei ($95)
	pei ($63)
	pei ($65)
	pei ($67)
	pei ($69)
	pei ($6B)
	pei ($6D)
	pei ($6F)
	pei ($71)
	pei ($73)
	pei ($75)
	ldy.b a2
	ldx.w tmsort,y
	stx.b a3
	lda.w #$0005
	sta.b d4
.loop:								; loop: newpos,x = $FFFF, newpnum,x = A, X + 1, X + 1, ...
	lda.w #$FFFF
	sta.w newpos,x
	sta.w newpnum,x
	inx
	inx
	stx.b a3
	dec.b d4
	bpl .loop
	jsl.l SetPlList
	lda.w #$0005
	sta.b d4
	lda.w #$007E
	sta.b $75
	lda.w #PlList
	sta.b a4
.1:									; Y = d4, A = [a4],y, A and $00FF, d5 = A, ...
	ldy.b d4
	lda.b [a4],y
	and.w #$00FF
	sta.b d5
	beq .5
	dec.b d5
	lda.w #$0005
	sta.b d3
	ldy.b a2
	ldx.w tmsort,y
	dex
	dex
.loop2:								; loop: X + 1, X + 1, a3 = X, A = pnum,x, ...
	inx
	inx
	stx.b a3
	lda.w pnum,x
	and.w #$00FF
	sta.b tmp0
	lda.b d5
	and.w #$00FF
	cmp.b tmp0
	beq .2
	dec.b d3
	bpl .loop2
	bra .5
.2:									; A = d4, A + $0006, Y = A, A = [a4],y, ...
	lda.b d4
	clc
	adc.w #$0006
	tay
	lda.b [a4],y
	and.w #$00FF
	bit.w #$0080
	beq .3
	ora.w #$FF00
.3:									; newpos,x = A, A = d5, A and $00FF, if $0080 bits clear go to .4, ...
	sta.w newpos,x
	lda.b d5
	and.w #$00FF
	bit.w #$0080
	beq .4
	ora.w #$FF00
.4:									; newpnum,x = A, Y = d4, A 8-bit, [a4],y = $00, ...
	sta.w newpnum,x
	ldy.b d4
	sep #$20
	lda.b #$00
	sta.b [a4],y
	rep #$20
.5:									; d4 - 1, if the result >= 0 go to .1, d4 = $0005, $75 = $007E, ...
	dec.b d4
	bpl .1
	lda.w #$0005
	sta.b d4
	lda.w #$007E
	sta.b $75
	lda.w #PlList
	sta.b a4
.6:									; Y = d4, A = [a4],y, A and $00FF, d5 = A, ...
	ldy.b d4
	lda.b [a4],y
	and.w #$00FF
	sta.b d5
	beq .12
	dec.b d5
	lda.w #$0005
	sta.b d3
	ldy.b a2
	ldx.w tmsort,y
	dex
	dex
.loop3:								; loop: X + 1, X + 1, a3 = X, A = newpnum,x, ...
	inx
	inx
	stx.b a3
	lda.w newpnum,x
	bit.w #$0080
	bne .7
	dec.b d3
	bpl .loop3
	bra .8
.7:									; a0 = X
	stx.b a0
.8:									; if position,x >= 0 go to .9, d3 - 1, if the result >= 0 go to .loop3
	lda.w position,x
	bpl .9
	dec.b d3
	bpl .loop3
.9:									; A = d4, A + $0006, Y = A, A = [a4],y, ...
	lda.b d4
	clc
	adc.w #$0006
	tay
	lda.b [a4],y
	and.w #$00FF
	bit.w #$0080
	beq .10
	ora.w #$FF00
.10:								; Y = a0, newpos,y = A, A = d5, A and $00FF, ...
	ldy.b a0
	sta.w newpos,y
	lda.b d5
	and.w #$00FF
	bit.w #$0080
	beq .11
	ora.w #$FF00
.11:								; newpnum,y = A, Y = d4, A 8-bit, [a4],y = $00, ...
	sta.w newpnum,y
	ldy.b d4
	sep #$20
	lda.b #$00
	sta.b [a4],y
	rep #$20
.12:								; d4 - 1, if the result >= 0 go to .6, pull A, $75 = A, ...
	dec.b d4
	bpl .6
	pla
	sta.b $75
	pla
	sta.b a4
	pla
	sta.b a3+2
	pla
	sta.b a3
	pla
	sta.b a2+2
	pla
	sta.b a2
	pla
	sta.b a1+2
	pla
	sta.b a1
	pla
	sta.b a0+2
	pla
	sta.b a0
	pla
	sta.b d5+2
	pla
	sta.b d5
	pla
	sta.b d4+2
	pla
	sta.b d4
	pla
	sta.b d3+2
	pla
	sta.b d3
	pla
	sta.b d2+2
	pla
	sta.b d2
	pla
	sta.b d1+2
	pla
	sta.b d1
	pla
	sta.b d0+2
	pla
	sta.b d0
	ldx.b a3
	rtl

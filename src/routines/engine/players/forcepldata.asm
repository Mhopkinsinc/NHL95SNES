forcepldata:						; face offs: moves team a2's players straight to their new positions
									; (newpos, newpnum)
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
	pei ($63)
	pei ($65)
	pei ($67)
	pei ($69)
	pei ($6B)
	pei ($6D)
	pei ($6F)
	pei ($71)
	ldy.b a2
	lda.w tmsort,y
	sta.b a3
	lda.w #$0005
	sta.b d4
.loop:								; loop: X = a3, A = newpos,x, A and $00FF, ...
	ldx.b a3
	lda.w newpos,x
	and.w #$00FF
	bit.w #$0080
	beq .1
	ora.w #$FF00
.1:									; d0 = A, position,x = A, if A - $0000 < 0 go to .4, call Setplass, ...
	sta.b d0
	sta.w position,x
	cmp.w #$0000
	bmi .4
	jsl.l Setplass
	ldx.b a3
	lda.w position,x
	cmp.w #$0004
	bne .2
	lda.w #$0012
	sta.b d0
	jsl.l assinsert
.2:									; X = a3, A = newpnum,x, A and $00FF, A * 2, ...
	ldx.b a3
	lda.w newpnum,x
	and.w #$00FF
	asl a
	sta.b d3
	lda.b a2
	beq .3
	lda.w #$0034
.3:									; A + d3, Y = A, tmpdst,y = $FFFF, d3 / 2, ...
	clc
	adc.b d3
	tay
	lda.w #$FFFF
	sta.w tmpdst,y
	lsr.b d3
	jsl.l setplayer
.4:									; X = a3, newpnum,x = $FFFF, newpos,x = A, a3 + 1, ...
	ldx.b a3
	lda.w #$FFFF
	sta.w newpnum,x
	sta.w newpos,x
	inc.b a3
	inc.b a3
	dec.b d4
	bpl .loop
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

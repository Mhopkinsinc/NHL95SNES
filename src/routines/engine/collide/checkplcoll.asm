checkplcoll:						; from checkcoll and other segments
	lda.w pflags,x
	bit.w #$8000
	bne .rtl
	cpx.w #$0018
	bcc .1
.rtl:								; return
	rtl
.1:									; d1 = OOlistpos,x
	lda.w OOlistpos,x
	sta.b d1
.loop:								; loop: if d1 = $000F go to .3, A = OOlist+1,y, A and $00FF, Y = A, ...
	ldy.b d1
	cpy.w #$000F
	beq .3
	lda.w OOlist+1,y
	and.w #$00FF
	tay
	lda.w Ylist,y
	sec
	sbc.b d3
	sec
	sbc.w #$000E
	bpl .3
	lda.w position,y
	bmi .2
	lda.w Xpos,y
	sec
	sbc.b d2
	cmp.w #$FFF1
	bmi .2
	cmp.w #$000F
	bpl .2
	lda.w pflags,y
	and.w #$8000
	ora.w pfnc,y
	bne .2
	cpy.w #$0018
	bcs .2
	jsl.l CollidePlayers
.2:									; d1 + 1, go to .loop
	inc.b d1
	bra .loop
.3:									; if OOlistpos,x = 0 go to .rtl2, d1 = A
	lda.w OOlistpos,x
	beq .rtl2
	sta.b d1
.loop2:								; loop: Y = d1, A = OOlist-1,y, A and $00FF, Y = A, ...
	ldy.b d1
	lda.w OOlist-1,y
	and.w #$00FF
	tay
	lda.b d3
	sec
	sbc.w Ylist,y
	sec
	sbc.w #$000E
	bpl .rtl2
	lda.w position,y
	bmi .4
	lda.w Xpos,y
	sec
	sbc.b d2
	cmp.w #$FFF1
	bmi .4
	cmp.w #$000F
	bpl .4
	lda.w pflags,y
	and.w #$8000
	ora.w pfnc,y
	bne .4
	cpy.w #$0018
	bcs .4
	jsl.l CollidePlayers
.4:									; d1 - 1, if the result is not 0 go to .loop2
	dec.b d1
	bne .loop2
.rtl2:								; return
	rtl

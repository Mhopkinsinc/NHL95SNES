checkob:							; called from other segments
	lda.w gmode
	bit.w #$0020
	bne .1
	jmp.w .rtl
.1:									; d0 = $0005, Y = $0000, if X < $000C go to .2, Y = $000C
	pei ($7F)
	pei ($81)
	pei ($83)
	pei ($85)
	pei ($63)
	pei ($65)
	lda.w #$0005
	sta.b d0
	ldy.w #$0000
	cpx.w #$000C
	bcc .2
	ldy.w #$000C
.2:									; a0 = Y, d1 = $0060, if pfgoal,x = 0 go to .3, go to .8
	sty.b a0
	lda.w #$0060
	sta.b d1
	lda.w pfgoal,x
	beq .3
	jmp.w .8
.3:									; d1 = $FFA0, A - pucky, if the result = 0 go to .loop, if plus go to .5
	lda.w #$FFA0
	sta.b d1
	sec
	sbc.w pucky
	beq .loop
	bpl .5
.loop:								; loop: Y = a0, if position,y < 0 go to .4, A = d1, A - Ypos,y, ...
	ldy.b a0
	lda.w position,y
	bmi .4
	lda.b d1
	sec
	sbc.w Ypos,y
	beq .4
	bpl .7
.4:									; a0 + 1, a0 + 1, d0 - 1, if the result >= 0 go to .loop
	inc.b a0
	inc.b a0
	dec.b d0
	bpl .loop
.5:									; d0 = $0040, A = $8000, if zero go to .6, ...
	lda.w #$0040
	sta.b d0
	lda.w #$8000
	trb.w sflags
	beq .6
	lda.w refwindow
	bne .6
	jsl.l ClearTextMapTop
.6:									; pull A, a0+2 = A, pull A, a0 = A, ...
	pla
	sta.b a0+2
	pla
	sta.b a0
	pla
	sta.b d1+2
	pla
	sta.b d1
	pla
	sta.b d0+2
	pla
	sta.b d0
.rtl:								; return
	rtl
.7:									; tmp0 = $0014, A = $8000, if not zero go to .6, ...
	lda.w #$0014
	sta.w tmp0
	lda.w #$8000
	tsb.w sflags
	bne .6
	lda.w RefCnt
	bpl .6
	phx
	jsl.l PushRef
	plx
	bra .6
.8:									; if d1 - pucky < 0 go to .5
	lda.b d1
	cmp.w pucky
	bmi .5
.loop2:								; loop: Y = a0, if position,y < 0 go to .9, if d1 - Ypos,y < 0 go to .7
	ldy.b a0
	lda.w position,y
	bmi .9
	lda.b d1
	cmp.w Ypos,y
	bmi .7
.9:									; a0 + 1, a0 + 1, d0 - 1, if the result >= 0 go to .loop2, ...
	inc.b a0
	inc.b a0
	dec.b d0
	bpl .loop2
	bra .5

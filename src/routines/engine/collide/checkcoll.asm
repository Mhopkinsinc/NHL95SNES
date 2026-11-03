checkcoll:							; collisions of object X (updateplayers): checkwallcoll at its position
									; and at its hot spot (GetFrameHot), then checkplcoll
	stz.w collflag
	lda.w pfnc,x
	bne .2
	pei ($8B)
	pei ($87)
	lda.w Xpos,x
	sta.b d2
	lda.w Ypos,x
	sta.b d3
	lda.w radiusx,x
	sta.w wcradiusx
	lda.w radiusy,x
	sta.w wcradiusy
	jsl.l checkwallcoll
	lda.w Wallcos,x
	ora.w Wallsin,x
	bne .1
	cpx.w #$0018
	bcs .1
	txa
	jsl.l GetFrameHot
	lda.w Xpos,x
	clc
	adc.b d0
	sta.b d2
	lda.w Ypos,x
	clc
	adc.b d1
	sta.b d3
	lda.w #$0001
	sta.w wcradiusx
	sta.w wcradiusy
	jsl.l checkwallcoll
.1:									; pull A, d2 = A, pull A, d3 = A, ...
	pla
	sta.b d2
	pla
	sta.b d3
	lda.w position,x
	bmi .2
	jsl.l checkplcoll
.2:									; if collflag = 0 go to .3, go to .6
	lda.w collflag
	beq .3
	jmp.w .6
.3:									; d1 = OOlistpos,x
	lda.w OOlistpos,x
	sta.b d1
.loop:								; loop: if d1 = $000F go to .4, A = OOlist+1,y, A and $00FF, d4 = A, ...
	ldy.b d1
	cpy.w #$000F
	beq .4
	lda.w OOlist+1,y
	and.w #$00FF
	sta.b d4
	tay
	lda.b d3
	sec
	sbc.w Ylist,y
	beq .4
	bmi .4
	inc.w OOlistpos,x
	lda.w OOlistpos,y
	dec a
	sta.w OOlistpos,y
	sep #$30
	ldy.b d1
	lda.b d4
	sta.w OOlist,y
	txa
	sta.w OOlist+1,y
	rep #$30
	inc.b d1
	bra .loop
.4:									; if OOlistpos,x = 0 go to .5, d1 = A
	lda.w OOlistpos,x
	beq .5
	sta.b d1
.loop2:								; loop: Y = d1, A = OOlist-1,y, A and $00FF, d4 = A, ...
	ldy.b d1
	lda.w OOlist-1,y
	and.w #$00FF
	sta.b d4
	tay
	lda.b d3
	sec
	sbc.w Ylist,y
	bpl .5
	dec.w OOlistpos,x
	lda.w OOlistpos,y
	inc a
	sta.w OOlistpos,y
	sep #$30
	ldy.b d1
	lda.b d4
	sta.w OOlist,y
	txa
	sta.w OOlist-1,y
	rep #$30
	dec.b d1
	bne .loop2
.5:									; Ylist,x = d3, return
	lda.b d3
	sta.w Ylist,x
	rtl
.6:									; if SPA,x >= SPAboardfront&$FFFF go to .rtl, Xpos,x = OldXpos,x, ...
	lda.w SPA,x
	cmp.w #SPAboardfront&$FFFF
	bcs .rtl
	lda.w OldXpos,x
	sta.w Xpos,x
	lda.w OldYpos,x
	sta.w Ypos,x
.rtl:								; return
	rtl

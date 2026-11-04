CompLine:							; from chk4lc and other segments
	pei ($7F)
	pei ($81)
	pei ($83)
	pei ($85)
	pei ($87)
	pei ($89)
	pei ($63)
	pei ($65)
	lda.w #$0003
	sta.b d0
	ldy.b a2
	lda.w tmap,y
	ldy.b a1
	cmp.w tmap,y
	beq CompLineEvenStrength
	bpl .1
	inc.b d0
	inc.b d0
.1:									; A = d0, push A, A + 1, call getlinee, ...
	lda.b d0
	pha
	inc a
	jsr.w getlinee
	sta.b d1
	lda.b $01,s
	jsr.w getlinee
	sec
	sbc.b d0
	bpl .2
	pla
	inc a
	bra .3
.2:									; pull A
	pla
.3:									; Y = a2, tmline,y = A
	ldy.b a2
	sta.w tmline,y
CompLineReturn:						; restores the saved scratch registers and returns after choosing a line
	pla
	sta.b a0+2
	pla
	sta.b a0
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
	rtl

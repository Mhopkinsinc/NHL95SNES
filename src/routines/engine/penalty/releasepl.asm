releasepl:							; return the released penalty player to an available on-ice slot
	pei ($7F)
	pei ($81)
	pei ($83)
	pei ($85)
	pei ($87)
	pei ($89)
	pei ($8B)
	pei ($8D)
	pei ($63)
	pei ($65)
	pei ($67)
	pei ($69)
	pei ($6B)
	pei ($6D)
	pei ($6F)
	pei ($71)
	ldy.b a2
	ldx.w tmsort,y
	dex
	dex
.loop:								; loop: X + 1, X + 1, if position,x >= 0 go to .loop, A = d0, ...
	inx
	inx
	lda.w position,x
	bpl .loop
	lda.b d0
	lsr a
	sta.b d3
	ldy.b a2
	lda.w tmap,y
	sta.b d1
	inc a
	sta.w tmap,y
	lda.w #$0001
	tsb.w tmflags
	tsb.w tmflags+2
	lda.w #priolist>>16
	sta.b a0+2
	lda.w #priolist&$FFFF
	sta.b a0
	lda.w tmgoalie,y
	bpl .1
	inc.b a0
.1:									; Y = d1, A = [a0],y, A and $00FF, position,x = A, ...
	ldy.b d1
	lda.b [a0],y
	and.w #$00FF
	sta.w position,x
	stx.b a3
	jsl.l Setplass
	jsl.l setplayer
	lda.w pflags,x
	ora.w #$1000
	sta.w pflags,x
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

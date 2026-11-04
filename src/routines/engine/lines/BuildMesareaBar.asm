BuildMesareaBar:					; no caller found: a four cell bar of d0 in mesarea (d0 / 128 capped at
									; 31, 8 a cell, tiles from d1, a 0 tile a space), the printa bits set, the
									; cells reversed
	pei ($7F)
	pei ($81)
	pei ($83)
	pei ($85)
	pei ($87)
	pei ($89)
	pei ($8B)
	pei ($8D)
	pei ($67)
	pei ($69)
	lda.w #$2000
	sta.w printa
	lda.b d0
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	cmp.w #$0020
	bcc .1
	lda.w #$001F
.1:									; d0 = A, Y = $0002, mesarea = $0006, d3 = $0003
	sta.b d0
	ldy.w #$0002
	lda.w #$0006
	sta.w mesarea
	lda.w #$0003
	sta.b d3
.loop:								; loop: d2 = $FFFF, if d0 < 0 go to .2, d2 = A, ...
	lda.w #$FFFF
	sta.b d2
	lda.b d0
	bmi .2
	sta.b d2
	cmp.w #$0008
	bcc .2
	lda.w #$0007
	sta.b d2
.2:									; A = d2, A + d1, if the result is not 0 go to .3, A = $0020
	lda.b d2
	sec
	adc.b d1
	and.w #$00FF
	bne .3
	lda.w #$0020
.3:									; mesarea,y = A, Y + 1, A = d0, A - $0008, ...
	sta.w mesarea,y
	iny
	lda.b d0
	sec
	sbc.w #$0008
	sta.b d0
	dec.b d3
	bpl .loop
	lda.b d1
	beq .4
	lda.w #$0C00
	tsb.w printa
.4:									; a1+2 = 0, a1 = mesarea, A = printx, A - $000B, ...
	stz.b a1+2
	lda.w #mesarea
	sta.b a1
	lda.w printx
	sec
	sbc.w #$000B
	sta.w printx
	lda.w #$4000
	tsb.w printa
	stz.b a1+2
	lda.w #mesarea
	sta.b a1
	sep #$20
	lda.w mesarea+5
	ldy.w mesarea+2
	sty.w mesarea+5
	sta.w mesarea+2
	rep #$30
	lda.w mesarea+3
	xba
	sta.w mesarea+3
	lda.w #$4000
	trb.w printa
	pla
	sta.b a1+2
	pla
	sta.b a1
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
	rtl

printscores1_per:					; steps a1 by period through the length-prefixed entries at $C09B54
									; (RatingColumns: its first word 0 keeps a1 there), calls print (a bare
									; rtl), writes team a2's score to mesarea; no caller found
	lda.w gsp
	sta.b d0
	cmp.w #$0004
	bne .1
	dec.w printx
	inc.b d0
.1:									; a0+2 = $00C0, a0 = $9B54
	lda.w #$00C0
	sta.b a0+2
	lda.w #$9B54
	sta.b a0
.loop:								; loop: a1+2 = a0+2, a1 = a0, A = [a0], A + a0, ...
	lda.b a0+2
	sta.b a1+2
	lda.b a0
	sta.b a1
	lda.b [a0]
	clc
	adc.b a0
	sta.b a0
	dec.b d0
	bpl .loop
	jsl.l print
	ldy.b a2
	lda.w tmscore,y
	sta.b d0
	jsl.l Mod100
	stz.b a1+2
	lda.w #mesarea
	sta.b a1
	lda.w #$0004
	sta.b [a1]
	lda.w #$0020
	sta.w mesarea+2
	lda.b d0
	sta.b r2
	lda.w #$000A
	sta.b r1
	phx
	jsl.l Div16x8U
	plx
	lda.b r0
	beq .2
	adc.w #$0030
	sta.w mesarea+2
.2:									; A = RDMPYL, A + $0030, $04F8 = A, return
	lda.l RDMPYL
	adc.w #$0030
	sta.w mesarea+3
	rtl

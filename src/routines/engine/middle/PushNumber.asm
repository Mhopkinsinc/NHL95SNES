PushNumber:							; a1 = d0 as a decimal string ending at mesareaEnd: the digits backward,
									; then the length word before them
	phx
	stz.b a1+2
	lda.w #mesareaEnd
	sta.b a1
	lda.b d0
.loop:								; loop: r2 = A, r1 = $000A, call Div16x8U, a1 - 1, ...
	sta.b r2
	lda.w #$000A
	sta.b r1
	jsl.l Div16x8U
	dec.b a1
	sep #$20
	lda.l RDMPYL
	sta.b [a1]
	rep #$30
	lda.b r0
	bne .loop
	dec.b a1
	dec.b a1
	lda.w #mesareaEnd
	sec
	sbc.b a1
	sta.b [a1]
	plx
	rtl

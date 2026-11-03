UnpackFitName:						; unpacks text X (UnpackText) and fits the name in at most A characters in
									; place, as FitName does
	sta.b r0
	jsl.l UnpackText
	stx.b r0+2
	ldy.w #$0000
	sep #$20
.loop:								; loop: if $0000,x = 0 go to .1, X + 1, Y + 1, go to .loop
	lda.w $0000,x
	beq .1
	inx
	iny
	bra .loop
.1:									; if Y < r0 go to .3, if zero go to .3, X = r0+2, Y = X
	cpy.b r0
	bcc .3
	beq .3
	ldx.b r0+2
	txy
.loop2:								; loop: A = $0001,x, X + 1, if $0001,x is not $20 go to .loop2, ...
	lda.w $0001,x
	inx
	cmp.b #$20
	bne .loop2
	sta.w $0002,y
	lda.b #$3D
	sta.w $0001,y
.loop3:								; loop: Y + 1, X + 1, $0002,y = $0000,x, ...
	iny
	inx
	lda.w $0000,x
	sta.w $0002,y
	bne .loop3
	rep #$20
	tya
	inc a
	sec
	sbc.b r0+2
	cmp.b r0
	bcc .3
	beq .3
	tya
	dec a
	clc
	sbc.b r0+2
	cmp.b r0
	bcc .2
	beq .2
	lda.b r0+2
	clc
	adc.b r0
	adc.w #$0004
	tax
	lda.w #$003D
	sta.w $0000,x
.2:									; A = r0+2, A + $0003, X = A, return
	lda.b r0+2
	clc
	adc.w #$0003
	tax
	rts
.3:									; A 16-bit, X = r0+2, return
	rep #$20
	ldx.b r0+2
	rts

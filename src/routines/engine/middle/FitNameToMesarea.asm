FitNameToMesarea:					; FitName into mesarea (Y = mesarea)
	ldy.w #mesarea
FitName:							; copies the zero-ended name at X to Y in at most A characters: as it is,
									; else the first name as an initial ('F= Last'), else cut short with '=';
									; X = Y
	sty.b r0+2
	sta.b r0
	phx
	sep #$20
.loop:								; loop: $0000,y = $0000,x, if $0000,x = 0 go to .1, X + 1, Y + 1, ...
	lda.w $0000,x
	sta.w $0000,y
	beq .1
	inx
	iny
	bra .loop
.1:									; A = X, A - $01,s, pull X, if A < r0 go to .2, ...
	txa
	sec
	sbc.b $01,s
	plx
	cmp.b r0
	bcc .2
	beq .2
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
	bcc .2
	beq .2
	sep #$20
	ldy.b r0+2
	ldx.b r0
.loop4:								; loop: $0000,y = $0003,y, if $0003,y = 0 go to .2, Y + 1, X - 1, ...
	lda.w $0003,y
	sta.w $0000,y
	beq .2
	iny
	dex
	bne .loop4
	dey
	rep #$20
	lda.w #$003D
	sta.w $0000,y
.2:									; A 16-bit, X = r0+2, return
	rep #$20
	ldx.b r0+2
	rts

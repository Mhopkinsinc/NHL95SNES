ConcatStrings:						; X = a new work buffer string: the zero-ended string at X followed by the
									; one at Y
	phy
	phx
	ldy.w #$0000
	sep #$20
.loop:								; loop: if $0000,x = 0 go to .1, Y + 1, X + 1, go to .loop
	lda.w $0000,x
	beq .1
	iny
	inx
	bra .loop
.1:									; A 16-bit, A = $03,s, X = A, A 8-bit
	rep #$20
	lda.b $03,s
	tax
	sep #$20
.loop2:								; loop: if $0000,x = 0 go to .2, Y + 1, X + 1, go to .loop2
	lda.w $0000,x
	beq .2
	iny
	inx
	bra .loop2
.2:									; A 16-bit, A = Y, A + 1, call AllocWorkBuf, ...
	rep #$20
	tya
	inc a
	jsl.l AllocWorkBuf
	pha
	tay
	lda.b $03,s
	tax
	sep #$20
.loop3:								; loop: if $0000,x = 0 go to .3, $0000,y = A, X + 1, Y + 1, ...
	lda.w $0000,x
	beq .3
	sta.w $0000,y
	inx
	iny
	bra .loop3
.3:									; A 16-bit, A = $05,s, X = A, A 8-bit
	rep #$20
	lda.b $05,s
	tax
	sep #$20
.loop4:								; loop: $0000,y = $0000,x, if $0000,x = 0 go to .4, X + 1, Y + 1, ...
	lda.w $0000,x
	sta.w $0000,y
	beq .4
	inx
	iny
	bra .loop4
.4:									; A 16-bit, pull X, pull A, pull A, ...
	rep #$20
	plx
	pla
	pla
	rts

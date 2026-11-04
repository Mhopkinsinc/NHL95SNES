PackTeamSecondText:					; A = a work buffer with team A's second packed string (A a team number)
									; as a length-prefixed text (PackShortText), X = its bank
	asl a
	tax
	lda.l $C30000,x
	tax
	lda.l $C30002,x
	tax
	jsl.l UnpackText
	ldx.b $16
	lda.b $0A
	beq .1
	inx
.1:									; call UnpackText
	jsl.l UnpackText
PackShortText:						; copies zero-ended text X into a length-prefixed work buffer with bit 7
									; toggled
	lda.w #$0004
	jsl.l AllocWorkBuf2
	pha
	tay
	sep #$20
.loop:								; loop: if $0000,x = 0 go to .1, A xor $80, $0001,y = A, X + 1, ...
	lda.w $0000,x
	beq .1
	eor.b #$80
	sta.w $0001,y
	inx
	iny
	bra .loop
.1:									; A 16-bit, A = Y, A - $01,s, pull X, ...
	rep #$20
	sec
	tya
	sbc.b $01,s
	plx
	sep #$20
	sta.w $0000,x
	rep #$20
	txa
	ldx.w #$007E
	rts

CopyFlipString2:					; copies the length-led string at X:A into a new second work buffer
									; (AllocWorkBuf2), bit 7 of each byte flipped and a zero after; X = the
									; copy
	sta.b r0
	stx.b r0+2
	lda.b [r0]
	and.w #$00FF
	sta.b tmp0
	inc a
	jsl.l AllocWorkBuf2
	pha
	tax
	ldy.w #$0001
	sep #$20
.loop:								; loop: A = [r0],y, A xor $80, $0000,x = A, Y + 1, ...
	lda.b [r0],y
	eor.b #$80
	sta.w $0000,x
	iny
	inx
	dec.b tmp0
	bne .loop
	stz.w $0000,x
	rep #$20
	plx
	rtl

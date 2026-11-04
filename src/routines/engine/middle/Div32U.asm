Div32U:								; r2 (4 bytes) / r1 into r0, unsigned; $7FFF if it does not fit
	sep #$20
	lda.b r2+3
	beq .hi0
	cmp.b r1+1
	bcc .go
	jmp.w Div_Overflow
.go:								; 16 quotient bits
	rep #$20
	lda.b r2+2
	ldx.w #$0010
.loop:								; one quotient bit
	asl.b r2
	rol a
	bcs .sub
	cmp.b r1
	bcc .bit
.sub:								; subtract
	sbc.b r1
	sec
.bit:								; the bit into r0
	rol.b r0
	dex
	bne .loop
	rtl
.hi0entry:							; an entry for r2 with its top byte 0: A 8-bit, then .hi0
									; (RecordHoldersScreen calls it)
	sep #$20
.hi0:								; top byte 0
	lda.b r1+1
	beq Div32U_ByteDivisor
	lda.b r2+2
	beq Div16U_Go
	cmp.b r1+1
	bcc Div_8Bits
	rep #$20
	lda.b r2+2
	and.w #$00FF
	ldx.w #$0010
.loop2:								; one quotient bit
	asl.b r2
	rol a
	bcs .sub2
	cmp.b r1
	bcc .bit2
.sub2:								; subtract
	sbc.b r1
	sec
.bit2:								; the bit into r0
	rol.b r0
	dex
	bne .loop2
	rtl

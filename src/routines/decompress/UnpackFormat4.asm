UnpackFormat4:						; format 4: literal runs and copies from up to 11 bits back
	lda.b [r1]
	bpl .1
	xba
	and.w #$007F
	lsr a
	lsr a
	lsr a
	beq .2
	sta.b $0A
	ldy.w #$0001
	lda.b [r1],y
	xba
	and.w #$07FF
	sta.b $0C
	sec
	lda.b r0
	sbc.b $0C
	tax
	clc
	lda.b r1
	adc.w #$0002
	sta.b r1
	ldy.b r0
	lda.b $0A
	jsl.l $0000A3
	lda.b r0
	adc.b $0A
	inc a
	sta.b r0
	bra UnpackFormat4
.1:									; A and $007F, $0A = A, A = r1, A + $0002, ...
	xba
	and.w #$007F
	sta.b $0A
	lda.b r1
	adc.w #$0002
	tax
	adc.b $0A
	sta.b r1
	lda.b $0A
	ldy.b r0
	jsl.l $00009F
	lda.b r0
	adc.b $0A
	inc a
	sta.b r0
	bra UnpackFormat4
.2:									; return
	plb
	rtl

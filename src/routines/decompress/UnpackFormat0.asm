UnpackFormat0:						; format 0: literal runs and copies from an absolute output offset
	lda.b [r1]
	bpl .1
	xba
	and.w #$007F
	beq .2
	sta.b $0A
	ldy.w #$0002
	lda.b [r1],y
	adc.b $0C
	tax
	lda.b r1
	adc.w #$0003
	sta.b r1
	ldy.b r0
	lda.b $0A
	jsl.l $0000A3
	lda.b r0
	adc.b $0A
	inc a
	sta.b r0
	bra UnpackFormat0
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
	bra UnpackFormat0
.2:									; return
	plb
	rtl

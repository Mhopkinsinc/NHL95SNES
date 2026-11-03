UnpackFormat6Step:					; one token of unpack format 6 by the flag bit in carry: set, a back
									; reference (length from the top 5 bits, 11-bit distance); clear, a
									; literal run (a count byte)
	bcc .1
	ldy.w #$0001
	lda.b [r1],y
	and.w #$00FF
	lsr a
	lsr a
	lsr a
	sta.b $0A
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
	adc.w #$0002
	jsl.l $0000A3
	lda.b r0
	adc.b $0A
	adc.w #$0003
	sta.b r0
	rts
.1:									; Y = $0001, A = [r1],y, if the result = 0 go to .2, A - 1, ...
	ldy.w #$0001
	lda.b [r1],y
	and.w #$00FF
	beq .2
	dec a
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
	rts
.2:									; pull A, return
	pla
	plb
	rtl

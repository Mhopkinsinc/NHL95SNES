ReadUserRecord:						; reads user A's record from save RAM ($307112 on, $30 bits a user) into
									; d0, $81, d1 and $85
	phx
	sta.b a0
	asl a
	adc.b a0
	sta.b a0+2
	asl a
	sec
	sbc.b a0
	tax
	lsr a
	lsr a
	lsr a
	sta.b a1
	txa
	and.w #$0007
	sta.b a1+2
	lda.w #$0030
	sta.b a2+2
	ldx.w #$7112
	jsr.w ReadUserField12
	sta.b d0
	ldx.w #$711E
	jsr.w ReadUserField5
	sta.b d0+2
	ldx.w #$7123
	jsr.w ReadUserField5
	sta.b d1
	ldx.w #$7128
	jsr.w ReadUserField12
	sta.b d1+2
	ldx.w #$7134
	jsr.w ReadUserField5
	sta.b d2
	ldx.w #$7139
	jsr.w ReadUserField5
	sta.b d2+2
	ldx.w #$713E
	jsr.w ReadUserField12
	sta.b d3
	ldx.w #$714A
	jsr.w ReadUserField12
	sta.b d4
	ldx.w #$7156
	jsr.w ReadUserField12
	sta.b d3+2
	plx
	rts

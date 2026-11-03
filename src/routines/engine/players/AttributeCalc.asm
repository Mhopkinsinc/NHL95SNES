AttributeCalc:						; A = rating A plus the player's hot / cold byte / 4 (HotColdTable at Y +
									; r3), kept within 0-15
	sta.b $42
	tya
	clc
	adc.b r3
	tay
	sep #$20
	lda.w HotColdTable,y
	lsr a
	lsr a
	bit.b #$00
	beq .1
	ora.b #$00
.1:									; A + $42, if the result >= 0 go to .2, A = $00
	clc
	adc.b $42
	bpl .2
	lda.b #$00
.2:									; if A < $0F go to .3, A = $0F
	cmp.b #$0F
	bcc .3
	lda.b #$0F
.3:									; A 16-bit, A and $00FF, return
	rep #$20
	and.w #$00FF
	rts

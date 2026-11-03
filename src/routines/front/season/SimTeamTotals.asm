SimTeamTotals:						; a simulated team's game totals at X from its goals A: shots are goals +
									; 10 + a random 0-29, the other fields random parts of the goals
	sta.b tmp1
	sta.w $000C,x
	lda.w #$001E
	jsr.w RandomBelowA7E
	adc.w #$000A
	clc
	adc.b tmp1
	sta.w $000E,x
	lda.w #$00C8
	jsr.w RandomBelowA7E
	sta.w $0010,x
	lda.b tmp1
	lsr a
	jsr.w RandomBelowA7E
	sta.w $0012,x
	jsr.w RandomBelowA7E
	sta.w $0014,x
	lda.b tmp1
	lsr a
	jsr.w RandomBelowA7E
	sta.w $0016,x
	jsr.w RandomBelowA7E
	sta.w $0018,x
	lda.b tmp1
	lsr a
	lsr a
	jsr.w RandomBelowA7E
	sta.w $001A,x
	jsr.w RandomBelowA7E
	adc.w $001A,x
	sta.w $001C,x
	rts

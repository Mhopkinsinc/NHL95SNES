UnpackTeamBonuses:					; unpacks the team bonus bytes at X into roster table Y: the nibbles of
									; bytes 0-2 at +$430 to +$43A (the high one of byte 1 and the low one of
									; byte 2 negated), byte 4 at +$43C
	lda.l $C30000,x
	pha
	and.w #$000F
	sta.w $0432,y
	pla
	and.w #$00F0
	lsr a
	lsr a
	lsr a
	lsr a
	sta.w $0430,y
	lda.l $C30001,x
	pha
	and.w #$000F
	sta.w $0436,y
	pla
	and.w #$00F0
	lsr a
	lsr a
	lsr a
	lsr a
	eor.w #$FFFF
	inc a
	sta.w $0434,y
	lda.l $C30002,x
	pha
	and.w #$000F
	eor.w #$FFFF
	inc a
	sta.w $043A,y
	pla
	and.w #$00F0
	lsr a
	lsr a
	lsr a
	lsr a
	sta.w $0438,y
	lda.l $C30004,x
	and.w #$00FF
	sta.w $043C,y
	rts

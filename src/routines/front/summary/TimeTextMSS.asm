TimeTextMSS:						; appends time A (seconds) to mesarea at X as M:SS (the minutes without a
									; leading 0, $3F the colon)
	ldx.w #$0000
	phy
	txy
	sta.b r2
	lda.w #$003C
	sta.b r1
	jsl.l Div16x8U
	tax
	lda.l BCDTable,x
	and.w #$00FF
	tyx
	jsr.w BCDTextAt
	lda.w #$003F
	sta.w mesarea,x
	inx
	txy
	lda.l RDMPYL
	tax
	lda.l BCDTable,x
	tyx
	pha
	and.w #$00F0
	lsr a
	lsr a
	lsr a
	lsr a
	adc.w #$0030
	sta.w mesarea,x
	inx
	pla
	and.w #$000F
	clc
	adc.w #$0030
	sta.w mesarea,x
	inx
	ply
	rts

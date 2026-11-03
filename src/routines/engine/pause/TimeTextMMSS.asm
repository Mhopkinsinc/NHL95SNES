TimeTextMMSS:						; appends time A (seconds) to mesarea at X as MM:SS (two minute digits)
	phy
	txy
	sta.b r2
	lda.w #$003C
	sta.b r1
	jsl.l Div16x8U
	tax
	lda.l BCDTable,x
	and.w #$00FF
	pha
	lsr a
	lsr a
	lsr a
	lsr a
	tyx
	jsr.w BCDTextAt
	pla
	and.w #$000F
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

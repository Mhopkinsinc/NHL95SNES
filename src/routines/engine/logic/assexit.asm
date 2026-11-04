assexit:							; from assfaceoff, assfaceoffpl and other segments
	lda.w assnum,x
	inc a
	and.w #$0007
	sta.w assnum,x
	phx
	phy
	txa
	asl a
	asl a
	adc.w assnum,x
	tay
	lda.w asslist,y
	and.w #$00FF
	ply
	plx
	sta.w asscur,x
	lda.w pflags,x
	ora.w #$0002
	sta.w pflags,x
	rtl

assinsert:							; X = player, d0 = assignment: added as the newest of the 8 slots (assnum
									; - 1), then assreplace
	lda.w assnum,x
	dec a
	and.w #$0007
	sta.w assnum,x
assreplace:							; from assdefd, assdefo, asswingd, ...
	lda.w pflags,x
	ora.w #$0002
	sta.w pflags,x
	txa
	asl a
	asl a
	adc.w assnum,x
	tay
	sep #$20
	lda.b d0
	sta.w asslist,y
	rep #$30
	sta.w asscur,x
	rtl

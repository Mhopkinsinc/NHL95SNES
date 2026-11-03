SetBGMapRegs:						; BG1SC, BG2SC, BG3SC, BG4SC, BG12NBA, ...
	phb
	phk
	plb
	sep #$30
	ldy.b #$01
	lda.b ($02,s),y
	sta.l BG1SC
	iny
	lda.b ($02,s),y
	sta.l BG2SC
	iny
	lda.b ($02,s),y
	sta.l BG3SC
	iny
	lda.b ($02,s),y
	sta.l BG4SC
	iny
	lda.b ($02,s),y
	sta.l BG12NBA
	iny
	lda.b ($02,s),y
	sta.l BG34NBA
	rep #$31
	lda.b $02,s
	adc.w #$0006
	sta.b $02,s
	plb
	rts

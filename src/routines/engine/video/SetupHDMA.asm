SetupHDMA:							; HDMA channel X from the 6 bytes after the jsl: DMAP, BBAD, source, ...
	phb
	sep #$20
	lda.b $04,s
	pha
	plb
	ldy.w #$0001
	rep #$21
	lda.b ($02,s),y
	sta.l DMAP0,x
	iny
	iny
	lda.b ($02,s),y
	sta.l A1T0L,x
	iny
	iny
	lda.b ($02,s),y
	sta.l A1B0,x
	ldy.w #$0006
	lda.b ($02,s),y
	sta.l $004307,x
	lda.b $02,s
	adc.w #$0006
	sta.b $02,s
	plb
	rtl

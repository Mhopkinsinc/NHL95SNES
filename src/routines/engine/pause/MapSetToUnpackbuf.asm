MapSetToUnpackbuf:					; MapSetToWRAM with the buffer unpackbuf
	ldy.w #unpackbuf
	sty.b r1
	ldy.w #unpackbuf>>16
	sty.b r1+2
MapSetToWRAM:						; unpacks the map set at X:A into the WRAM buffer at r1 (bank in $32): the
									; map, the tiles and the colours
	sta.b r2
	stx.b r2+2
	clc
	lda.b r2
	adc.w #$0005
	sta.b r0
	bcc .1
	inx
.1:									; r0+2 = X, A = r1, X = r1+2, call DecompressLZSS, ...
	stx.b r0+2
	lda.b r1
	ldx.b r1+2
	jsr.w DecompressLZSS
	jsr.w NextMapSetChunkWRAM
	clc
	lda.b r2
	adc.w #$0008
	sta.b r0
	lda.b r2+2
	adc.w #$0000
	sta.b r0+2
	jsr.w DecompressLZSSHere
	jsr.w NextMapSetChunkWRAM
	clc
	lda.b r2
	adc.w #$0007
	sta.b r0
	lda.b r2+2
	adc.w #$0000
	sta.b r0+2
	sec
	lda.b [r2]
	sbc.w #$0005
	tax
	ldy.w #$0000
	sep #$20
.loop:								; loop: WMDATA = [r0],y, Y + 1, X - 1, ...
	lda.b [r0],y
	sta.l WMDATA
	iny
	dex
	bne .loop
	rep #$20
	rtl

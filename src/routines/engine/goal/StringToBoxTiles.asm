StringToBoxTiles:					; readies the zero ended string at X in place for QueueVRAMDMALen: bit 7
									; of each character flipped ('=' becomes $AE), a length byte in front
	phx
	sep #$20
.1:									; if $0000,x = 0 go to .4, if $0000,x is not $3D go to .2, A = $AE, ...
	lda.w $0000,x
	beq .4
	cmp.b #$3D
	bne .2
	lda.b #$AE
	bra .3
.2:									; A xor $80
	eor.b #$80
.3:									; $0000,x = A, X + 1, go to .1
	sta.w $0000,x
	inx
	bra .1
.4:									; A 16-bit, A = X, A - $01,s, if the result = 0 go to .5, ...
	rep #$20
	txa
	sec
	sbc.b $01,s
	beq .5
	pha
	dec a
	txy
	dex
	mvp $7E,$7E
	pla
.5:									; A 8-bit, pull X, $0000,x = A, A 16-bit, ...
	sep #$20
	plx
	sta.w $0000,x
	rep #$20
	rts

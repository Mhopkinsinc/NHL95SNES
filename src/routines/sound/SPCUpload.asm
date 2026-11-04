SPCUpload:							; upload the blocks at X:A to the sound CPU boot loader (94S SPCUpload)
	pea.w $7E80
	plb
	sta.b r0
	sep #$20
	txa
	sta.b r0+2
	lda.b #$1B
	sta.w APUIO3
	rep #$20
	lda.w #$BBAA
	jsr.w WaitSPCUploadAck
	sep #$20
	lda.b #$CC
	bra SPCUploadNextBlock

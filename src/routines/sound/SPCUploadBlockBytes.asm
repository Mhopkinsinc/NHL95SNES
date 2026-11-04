SPCUploadBlockBytes:				; sends X bytes through the boot loader, then reads the next block header
	jsr.w ReadSPCUploadByte
	xba
	lda.b #$00
	bra .1
.loop:								; loop: call ReadSPCUploadByte, call WaitSPCUploadAck, A + 1
	xba
	jsr.w ReadSPCUploadByte
	xba
	jsr.w WaitSPCUploadAck
	inc a
.1:									; A 16-bit, APUIO0 = A, A 8-bit, X - 1, ...
	rep #$20
	sta.w APUIO0
	sep #$20
	dex
	bne .loop
	jsr.w WaitSPCUploadAck
.loop2:								; loop: A + $03, if the result = 0 go to .loop2
	adc.b #$03
	beq .loop2
SPCUploadNextBlock:					; reads the next block length and destination, preserving the handshake
									; byte
	pha
	rep #$20
	jsr.w ReadSPCUploadWord
	tax
	jsr.w ReadSPCUploadWord
	sta.w APUIO2
SPCUploadBlockHandshake:			; signals data or execution to the boot loader from the block length in X
	sep #$20
	cpx.w #$0001
	lda.b #$00
	rol a
	sta.w APUIO1
	adc.b #$7F
	pla
	sta.w APUIO0
	jsr.w WaitSPCUploadAck
	bvs SPCUploadBlockBytes
	lda.b #$00
	sta.w APUIO0
	rep #$20
	plb
	rtl

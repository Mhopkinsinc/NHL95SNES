ReadSPCUploadByte:					; reads the next upload byte through r0 and advances the source pointer
	lda.b [r0]
	ldy.b r0
	iny
	bne .1
	inc.b r0+2
	ldy.w #$8000
.1:									; r0 = Y, return
	sty.b r0
	rts

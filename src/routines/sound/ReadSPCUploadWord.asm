ReadSPCUploadWord:					; reads the next upload word through r0 and advances the source pointer
	lda.b [r0]
	ldy.b r0
	iny
	bne .1
	inc.b r0+2
	ldy.w #$8000
.1:									; Y + 1, if the result is not 0 go to .2, r0+2 + 1, Y = $8000
	iny
	bne .2
	inc.b r0+2
	ldy.w #$8000
.2:									; r0 = Y, return
	sty.b r0
	rts

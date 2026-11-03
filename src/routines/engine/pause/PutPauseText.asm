PutPauseText:						; puts the length-led string at [r0] into the pause screen text map at
									; offset A, as tiles with attribute $3A00
	clc
	adc.w PauseMapBuf
	tax
	lda.b [r0]
	and.w #$00FF
	tay
.loop:								; loop: r0 + 1, A = [r0], A and $00FF, A or $3A00, ...
	inc.b r0
	lda.b [r0]
	and.w #$00FF
	ora.w #$3A00
	sta.w $0000,x
	inx
	inx
	dey
	bne .loop
	rts

FillPauseMapTileRun:				; writes consecutive tile words into the pause map at offset A starting
									; with tile Y
	clc
	adc.w PauseMapBuf
	tax
	tya
	ldy.w #$0000
.loop:								; loop: $7E0000,x = A, X + 1, X + 1, A + 1, ...
	sta.l $7E0000,x
	inx
	inx
	inc a
	iny
	cpy.w #$000A
	bne .loop
	rts

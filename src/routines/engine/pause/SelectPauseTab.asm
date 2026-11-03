SelectPauseTab:						; copies the active tab tiles into the current pause tab header
	lda.w pausetab
	asl a
	tax
	lda.l PauseTabSelected,x
CopyPauseTabTiles:					; copies a tab's two rows of eight tiles from pause map offset A to its
									; place in the tab header (PauseTabPlaces by X); DeselectPauseTab and
									; SelectPauseTab end here
	adc.w PauseMapBuf
	tay
	lda.l PauseTabPlaces,x
	adc.w PauseMapBuf
	tax
	jsr.w CopyPauseTabTileRow
	txa
	adc.w #$0030
	tax
	tya
	adc.w #$0030
	tay
CopyPauseTabTileRow:				; copies eight tile words from Y to X
	lda.w #$0008
	sta.b tmp0
.loop:								; loop: $0000,x = $0000,y, Y + 1, Y + 1, X + 1, ...
	lda.w $0000,y
	sta.w $0000,x
	iny
	iny
	inx
	inx
	dec.b tmp0
	bne .loop
	rts

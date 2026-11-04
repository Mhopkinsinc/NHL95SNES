DeselectPauseTab:					; copies the inactive tab tiles into the current pause tab header
	lda.w pausetab
	asl a
	tax
	lda.l PauseTabPlain,x
	bra CopyPauseTabTiles

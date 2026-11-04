AllocClearWorkBuf:					; takes A bytes from the work buffer (AllocWorkBuf) and clears them
									; (ClearRAM7E); returns A = their start
	phx
	phy
	pha
	jsl.l AllocWorkBuf
	ply
	pha
	jsl.l ClearRAM7E
	pla
	ply
	plx
	rtl

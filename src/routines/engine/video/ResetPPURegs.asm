ResetPPURegs:						; reset the scroll copies and the window and colour math registers
	pha
	stz.w BG1HScroll
	stz.w BG2HScroll
	stz.w BG3HScroll
	lda.w #$FFFF
	sta.w BG1VScroll
	sta.w BG2VScroll
	sta.w BG3VScroll
	phd
	lda.w #INIDISP					; direct page on the PPU registers
	tcd
	sep #$20
	stz.b CGADSUB&$FF
	stz.b CGWSEL&$FF
	stz.b TMW&$FF
	stz.b MOSAIC&$FF
	stz.b SETINI&$FF
	stz.b TS&$FF
	stz.b TSW&$FF
	stz.b W12SEL&$FF
	stz.b W34SEL&$FF
	stz.b WOBJSEL&$FF
	stz.b $C8						; no PPU register here (as the game has it)
	lda.b #$E0
	sta.b COLDATA&$FF
	rep #$20
	pld
	pla
	rtl

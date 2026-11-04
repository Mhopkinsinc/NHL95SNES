JoyDirIndex_Hi:						; JoyDirIndex of the high byte of A
	xba
JoyDirIndex:						; X = 2 * JoyDirTable[the d-pad bits A & $F]
	and.w #$000F
	tax
	lda.l JoyDirTable,x
	and.w #$00FF
	asl a
	tax
	rtl

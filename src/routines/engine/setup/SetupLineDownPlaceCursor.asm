SetupLineDownPlaceCursor:			; stores the cursor y position and applies palette 0 to the new setup line
	sta.b $08,x
	jsr.w SetupLinePalette0
SetupLineDownReturn:				; the shared rts of SetupLineDown
	rts

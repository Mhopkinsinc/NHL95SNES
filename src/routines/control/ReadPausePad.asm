ReadPausePad:						; read the controller that owns the pause menu
	lda.w pausepad
	lsr a
	jmp.w ReadjoyA

SetupOptionRunRoutine:				; pushes the option routine minus one before drawing the line
	dex
	phx
DrawSetupLineJump:					; jumps to DrawSetupLine: the option value routines' shared tail
	jmp.w DrawSetupLine
	pla								; unreached: no code branches, falls or points here
	rts

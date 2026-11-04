NMI_FrameHookReturn:				; NMI after the frame hook: pads and sound, then restore and rti
	jsl.l Multi5Bios
	rep #$30
	jsl.l SendQueuedSoundCmd
	stz.b NMISkip
	ply
	plx
	pla
	plb
	pld
	rti

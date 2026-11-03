IRQ_HookReturn:						; IRQ: restore the registers and rti (where the IRQ hooks return)
	rep #$30
	ply
	plx
	pla
	plb
	rti

IRQ_Fast:							; IRQ: save the registers, acknowledge TIMEUP and run the IRQ hook
	rep #$30
	sei
	phb
	phk
	plb
	pha
	phx
	phy
	sep #$10
	ldx.w TIMEUP
	ldx.b #IRQ_HookReturn>>16
	phx
	pea.w IRQ_HookReturn-1
	jml.w [IRQHook]

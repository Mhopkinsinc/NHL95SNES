VBlank:								; NMI: save the registers; just return while NMISkip is set
	rep #$30
	phd
	phb
	pea.w $8080						; data bank $80 (pulled twice)
	plb
	plb
	pha
	lda.w #$0000
	tcd
	lda.w RDNMI
	lda.b NMISkip
	beq .run
	pla
	plb
	pld
	rti
.run:								; NMISkip clear: set it, then the NMI hook
	inc a
	sta.b NMISkip
	phx
	phy
	sep #$10
	ldx.w NMIHookNext+1
	beq .1
	lda.w NMIHookNext
	sta.w NMIHook
	stz.w NMIHookNext
	ldx.w NMIHookNext+2
	stx.w NMIHook+2
.1:									; call [NMIHook]; its rtl lands on NMI_HookReturn
	ldx.b #NMI_HookReturn>>16
	phx
	pea.w NMI_HookReturn-1
	jml.w [NMIHook]

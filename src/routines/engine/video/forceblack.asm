forceblack:							; BlankScreen, then ResetPPURegs
	jsl.l BlankScreen
	bra ResetPPURegs

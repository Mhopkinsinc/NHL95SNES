SetNMIHook:							; run the routine at X:A as the NMI hook from the next NMI
	sep #$10
	stx.w NMIHookNext+2
	sta.w NMIHookNext
	rep #$10
	rtl

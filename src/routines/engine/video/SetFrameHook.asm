SetFrameHook:						; run the routine at X:A as the frame hook from the next NMI
	sep #$10
	stx.w FrameHookNext+2
	sta.w FrameHookNext
	rep #$10
	rtl

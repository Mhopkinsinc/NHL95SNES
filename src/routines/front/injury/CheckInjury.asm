CheckInjury:						; counts InjCntDown down; at 0, ShowInjuryBox
	dec.w InjCntDown
	bne .rtl
	jmp.w ShowInjuryBox
.rtl:								; return
	rtl

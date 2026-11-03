clockcont:							; called from other segments
	lda.w gmclock
	ora.w gameclock
	bne .rtl
	jsl.l freezewindow
	jmp.w clockcont_0
.rtl:								; return
	rtl

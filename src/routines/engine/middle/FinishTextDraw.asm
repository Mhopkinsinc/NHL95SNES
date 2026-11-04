FinishTextDraw:						; record the rightmost text extent and return
	lda.b $0A
	cmp.l $0018DC
	bcc .rtl
	sta.l $0018DC
.rtl:								; return
	rtl

ClearTextMap:						; fills the text map (VRAM $5800, $400 words) with the blank entry
									; TextMapFill, two queued fixed-source DMAs
	dec.b QueueBusy
	lda.b VRAMModeQueueSP
	tsx
	tcs
	stx.b VRAMModeQueueSP
	pea.w $0400
	pea.w $0000
	pea.w $5800
	pea.w $1808
	pea.w TextMapFill>>16
	pea.w TextMapFill&$FFFF
	pea.w $0400
	pea.w $0080
	pea.w $5800
	pea.w $1908
	pea.w TextMapFill>>16
	pea.w (TextMapFill+1)&$FFFF
	lda.b VRAMModeQueueSP
	tsx
	tcs
	stx.b VRAMModeQueueSP
	stz.b QueueBusy
	rtl

ClearTextMapTop:					; ClearTextMap for the map's top half ($200 words)
	phx
	dec.b QueueBusy
	lda.b VRAMModeQueueSP
	tsx
	tcs
	stx.b VRAMModeQueueSP
	pea.w $0200
	pea.w $0000
	pea.w $5800
	pea.w $1808
	pea.w TextMapFill>>16
	pea.w TextMapFill&$FFFF
	pea.w $0200
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
	plx
	rtl

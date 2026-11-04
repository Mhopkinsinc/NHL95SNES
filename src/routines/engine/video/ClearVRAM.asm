ClearVRAM:							; QueueClearVRAM, then WaitTransfers
	dec.b QueueBusy
	lda.b VRAMModeQueueSP
	tsx
	tcs
	stx.b VRAMModeQueueSP
	pea.w $0400
	pea.w $0000
	phy
	pea.w $1808
	pea.w ZeroFillWord>>16
	pea.w ZeroFillWord
	pea.w $0400
	pea.w $0080
	phy
	pea.w $1908
	pea.w ZeroFillWord>>16
	pea.w ZeroFillWord
	lda.b VRAMModeQueueSP
	tsx
	tcs
	stx.b VRAMModeQueueSP
	stz.b QueueBusy
	jml.l WaitTransfers

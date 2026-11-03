DrawPeriodBox:						; the period box: the clock (showclockdma), the period label (PeriodLabels
									; by gsp) and its frame (Framer: 10 x 4 with sflags bit $2000, else 10 x
									; 2)
	jsl.l showclockdma
	lda.w gsp
	asl a
	asl a
	adc.w #PeriodLabels&$FFFF
	ldx.w #PeriodLabels>>16
	ldy.w #$5B21
	jsl.l QueueVRAMDMALen
	lda.w sflags
	bit.w #$2000
	bne .1
	ldx.w #$000A
	ldy.w #$0002
	lda.w #$5B00
	jml.l Framer
.1:									; X = $000A, Y = $0004, A = $5AC0, go to Framer
	ldx.w #$000A
	ldy.w #$0004
	lda.w #$5AC0
	jml.l Framer

SetupScrollIRQ:						; no caller found (not traced): the three BG1 scroll splits at the
									; lines A, X and Y; the scroll values start at $FFFF
	sta.w irqline1
	stx.w irqline2
	sty.w irqline3
	lda.w #$FFFF
	sta.w irqvscroll1
	sta.w irqvscroll2
	sta.w irqvscroll3
	lda.w #$00C4
	sta.w IRQHTime
	lda.w #IRQ_StatsScroll1&$FFFF
	ldx.w #IRQ_StatsScroll1>>16
	ldy.w irqline1
	jml.l SetIRQ

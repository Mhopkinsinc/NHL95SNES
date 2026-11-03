IRQ_StatsScroll3:					; IRQ hook: the last BG1 scroll split, then IRQ_StatsScroll1 again
	sep #$20
	lda.w irqvscroll3
	sta.l BG1VOFS
	lda.w irqvscroll3+1
	sta.l BG1VOFS
	rep #$20
	lda.w #IRQ_StatsScroll1&$FFFF
	sta.w IRQHook
	rtl

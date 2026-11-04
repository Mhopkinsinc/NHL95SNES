IRQ_StatsScroll2:					; IRQ hook: the second BG1 scroll split, then IRQ_StatsScroll3
	sep #$20
	lda.w irqvscroll2
	sta.l BG1VOFS
	lda.w irqvscroll2+1
	sta.l BG1VOFS
	rep #$20
	lda.w #IRQ_StatsScroll3&$FFFF
	sta.w IRQHook
	lda.w irqline3
	sta.l VTIMEL
	rtl

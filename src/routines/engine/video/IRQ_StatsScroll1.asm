IRQ_StatsScroll1:					; IRQ hook: the first BG1 scroll split, then IRQ_StatsScroll2
	sep #$20
	lda.w irqvscroll1
	sta.l BG1VOFS
	lda.w irqvscroll1+1
	sta.l BG1VOFS
	rep #$20
	lda.w #IRQ_StatsScroll2&$FFFF
	sta.w IRQHook
	lda.w irqline2
	sta.l VTIMEL
	lda.w #$FFFF
	rtl

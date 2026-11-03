ScrollTradeListDown:				; the list's first row + 1, then it scrolls down a row over 8 frames, the
									; BG3 scroll table rebuilt each frame (TradeScrollStepDown for it,
									; TradeListScrollEntries for the other)
	lda.b $01,s
	tax
	inc.b $77,x
	lda.w #$0007
.1:									; push A, Y = $0003, if $03,s is not 0 go to .2, ...
	pha
	ldy.w #$0003
	wai
	lda.b $03,s
	bne .2
	jsr.w TradeScrollStepDown
	lda.b $05,s
	sta.w TradeScrollHDMA,y
	lda.w #$FFFF
	sta.w TradeScrollHDMA+$1,y
	iny
	iny
	iny
	lda.b $03,s
	eor.w #$0002
	jsr.w TradeListScrollEntries
	lda.w #$0001
	sta.w TradeScrollHDMA,y
	dec a
	sta.w TradeScrollHDMA+$3,y
	dec a
	sta.w TradeScrollHDMA+$1,y
	bra .3
.2:									; A xor $0002, call TradeListScrollEntries, TradeScrollHDMA,y = $05,s, ...
	eor.w #$0002
	jsr.w TradeListScrollEntries
	lda.b $05,s
	sta.w TradeScrollHDMA,y
	lda.w #$FFFF
	sta.w TradeScrollHDMA+$1,y
	iny
	iny
	iny
	jsr.w TradeScrollStepDown
	lda.w #$0001
	sta.w TradeScrollHDMA,y
	dec a
	sta.w TradeScrollHDMA+$3,y
	dec a
	sta.w TradeScrollHDMA+$1,y
.3:									; pull A, A - 1, if the result >= 0 go to .1, pull A, ...
	pla
	dec a
	bpl .1
	pla
	pla
	stz.w padlast
	stz.w repeatdelayframes
	rts

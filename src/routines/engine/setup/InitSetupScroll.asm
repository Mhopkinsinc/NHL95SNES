InitSetupScroll:					; the setup screen's scrolling:  $10=BG3ScrollHDMA1 copied to
									; BG3ScrollHDMA, the BandScroll words and the BG scrolls reset,
									; SetupLineRow = $10= $10
	lda.w #$001B
	ldx.w #$48E2
	ldy.w #BG3ScrollHDMA
	mvn $7E,$C0
	lda.w #$FFFF
	sta.w BandScroll
	sta.w BandScroll+$2
	sta.w BandScroll+$4
	sta.w BandScroll+$6
	sta.w BandScroll+$8
	sta.w BandScroll+$10
	stz.w BG1HScroll
	stz.w BG2HScroll
	stz.w BG3HScroll
	sta.w BG1VScroll
	sta.w BG3VScroll
	lda.w #$FFFA
	sta.w BG2VScroll
	lda.w #$FF90
	sta.w BandScroll+$A
	lda.w #$0010
	sta.w SetupLineRow
	rts

DarkBlueColoursHook:				; NMI hook: DarkBlueColours to CGRAM colours $11 on
	lda.w #DMA_CGRAM				; M 16, X 8 as the NMI calls hooks
	sta.w DMAP0
	lda.w #DarkBlueColours
	sta.w A1T0L
	ldx.b #DarkBlueColours>>16
	stx.w A1B0
	lda.w #BlueColoursHook-DarkBlueColours
	sta.w DAS0L
	ldx.b #$11
	stx.w CGADD
	ldx.b #MDMAEN_CH0
	stx.w MDMAEN
	rtl

BlackBackdrop:						; SetBackdropColour with colour 0 (black)
	lda.w #$0000
SetBackdropColour:					; writes colour A to CGRAM entry 0 (the backdrop), with QueueBusy set
									; around it
	inc.b QueueBusy
	pha
	sep #$20
	lda.b #$00
	sta.l CGADD
	pla
	sta.l CGDATA
	pla
	sta.l CGDATA
	rep #$20
	dec.b QueueBusy
	rtl

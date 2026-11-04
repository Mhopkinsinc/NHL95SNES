WaitNoButtons:						; wait until no button is held on pad 1
	pha
.loop:								; until no button (the d-pad bits ignored)
	lda.b PadRaw1
	and.w #$FFF0
	bne .loop
	pla
	rtl
.t1:								; the same for pad 2
	pha
.loopx:								; until no button
	lda.b PadRaw2
	and.w #$FFF0
	bne .loopx
	pla
	rtl
.t2:								; wait up to X frames for no button on pad 1
	pha
.loopx2:							; next frame
	jsl.l WaitFrame
	lda.b PadRaw1
	and.w #$FFF0
	beq .1
	dex
	bne .loopx2
.1:									; return
	pla
	rtl
.t1x:								; the same for pad 2
	pha
.loopxx:							; next frame
	jsl.l WaitFrame
	lda.b PadRaw2
	and.w #$FFF0
	beq .1x
	dex
	bne .loopxx
.1x:								; return
	pla
	rtl

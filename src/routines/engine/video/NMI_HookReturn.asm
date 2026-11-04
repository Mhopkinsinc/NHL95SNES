NMI_HookReturn:						; NMI after the hook: IRQ timers, BG scroll, queued transfers, DMA enables
	rep #$30
	lda.w IRQVTime
	sta.l VTIMEL
	lda.w IRQHTime
	sta.l HTIMEL
	sep #$30
	lda.w BG1HScroll
	sta.w BG1HOFS
	lda.w BG1HScroll+1
	sta.w BG1HOFS
	lda.w BG1VScroll
	sta.w BG1VOFS
	lda.w BG1VScroll+1
	sta.w BG1VOFS
	lda.w BG2HScroll
	sta.w BG2HOFS
	lda.w BG2HScroll+1
	sta.w BG2HOFS
	lda.w BG2VScroll
	sta.w BG2VOFS
	lda.w BG2VScroll+1
	sta.w BG2VOFS
	lda.w BG3HScroll
	sta.w BG3HOFS
	lda.w BG3HScroll+1
	sta.w BG3HOFS
	lda.w BG3VScroll
	sta.w BG3VOFS
	lda.w BG3VScroll+1
	sta.w BG3VOFS
	lda.b #$80						; forced blank while the transfers run
	sta.w INIDISP
	rep #$30
	lda.w TransfersReady
	beq .1
	bit.b QueueBusy
	bmi .1
	stz.w MDMAEN
	jsl.l ProcessQueuedTransfers
	stz.w TransfersReady
.1:									; DMA and HDMA enables
	lda.w DMAEnShadow
	sta.w MDMAEN
NMI_Tick:							; Vcount + 1, the fade, FrameCount, then the frame hook
	clc
	lda.b Vcount
	adc.w #$0001
	sta.b Vcount
	bcc .1
	inc.b Vcount+2
.1:									; the fade
	lda.w fadein
	bmi .fadeout
	dec a
	bmi .fadein
	sta.w fadein
	sep #$20
	bra .write
.fadein:							; fadein 0: brightness + 1 up to 15
	sep #$20
	lda.w brightness
	bpl .up
	lda.b #$FF
.up:								; up one step
	inc a
	cmp.b #$10
	bcs .write
	sta.w brightness
	bra .write
.fadeout:							; fadein negative: brightness - 1 until negative
	sep #$20
	lda.w brightness
	bmi .write
	dec a
	sta.w brightness
.write:								; brightness to INIDISP
	lda.w brightness
	sta.w INIDISP
	rep #$20
	lda.w FrameCountHold
	bne .2
	inc.w FrameCount
.2:									; the frame hook: FrameHookNext to FrameHook
	sep #$10
	ldx.w FrameHookNext+1
	beq .3
	lda.w FrameHookNext
	sta.w FrameHook
	stz.w FrameHookNext
	ldx.w FrameHookNext+2
	stx.w FrameHook+2
.3:									; call [FrameHook]; its rtl lands on NMI_FrameHookReturn
	ldx.b #NMI_FrameHookReturn>>16
	phx
	pea.w NMI_FrameHookReturn-1
	jml.w [FrameHook]

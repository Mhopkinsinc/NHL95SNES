ShowPleaseWait:						; fades out and shows the Please Wait= screen, then waits for the fade in
	jsl.l FadeOutWait
	jsl.l WaitTransfers
	stz.w DMAEnShadow
	jsl.l ResetSprites
	jsr.w SetupScreen
	stz.b $26
	jsr.w RefreshSprites
	stz.b $CF
	lda.w #$0100
	sta.b $D1
	ldx.w #TxtPleaseWait&$FFFF
	ldy.w #$000C
	jsl.l PrintItalicCentred
	jsl.l SendTextMap
	stz.w fadestep
	lda.w #$000F
.loop:								; loop: if A is not brightness go to .loop, return
	cmp.w brightness
	bne .loop
	rts

CreatePlayer:						; play mode Make Player: CheckCreateSlots, the Create Player page
									; (DrawNameEntry), then the front end's screen states (NameEntry first)
	jsl.l FadeOutWait
	jsl.l CheckCreateSlots
	jsr.w DrawNameEntry
	stz.w fadestep
ScreenStateLoop:					; the front end loop: each frame the transfers, the pads and the sprites,
									; then the handler of screen state $99 (ScreenStateHandlers)
	jsl.l WaitTransfers
	jsl.l ReadMenuPads
	inc.b $26
	jsl.l AnimateSprites
	lda.w #OAMBuf+$1FF
	sta.b $28
	lda.w #OAMHighBytes
	sta.b $2A
	jsl.l BuildSpriteOAM
	jsl.l PackOAMHigh
	lda.b d6+2
	asl a
	tax
	jsr (ScreenStateHandlers,x)
	bra ScreenStateLoop

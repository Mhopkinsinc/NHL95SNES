RefreshSprites:						; animates the sprites, builds OAM from them, packs the high table and
									; waits for the transfers
	inc.b $26
	jsl.l AnimateSprites
	lda.w #OAMBuf+$1FF
	sta.b $28
	lda.w #OAMHighBytes
	sta.b $2A
	jsl.l BuildSpriteOAM
	jsl.l PackOAMHigh
	jsl.l WaitTransfers
	rts

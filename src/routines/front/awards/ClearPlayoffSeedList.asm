ClearPlayoffSeedList:				; clears the ranked playoff seed pointer list
	stz.w ScratchBuf
	ldx.w #ScratchBuf
	ldy.w #ScratchBuf+$2
	lda.w #$000D
	mvn $7E,$7E
	rts

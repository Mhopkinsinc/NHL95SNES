ExitToPauseMenu:					; leaves a pause menu screen: fade out, the text map freed, VRAM cleared,
									; back to the pause menu (PauseScreenDraw); opened from the season's Other
									; Scores it only fades out and returns
	jsl.l FadeOutWait
	stz.w DMAEnShadow
	lda.w SeasonScoresMode
	beq .1
	rts
.1:									; call ClearNMIHook, A = $0800, call FreeWorkBuf, WorkBufMark = A, ...
	jsl.l ClearNMIHook
	lda.w #$0800
	jsl.l FreeWorkBuf
	sta.w WorkBufMark
	jsl.l WaitTransfers
	jsl.l RestorePauseBuffers
	ldy.w #$5000
	jsl.l QueueClearVRAM
	jsl.l WaitTransfers
	stz.w padchangeany
	lda.w SeasonScoresMode
	jmp.w PauseScreenDraw

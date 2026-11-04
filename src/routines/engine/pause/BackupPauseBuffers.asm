BackupPauseBuffers:					; allocate and copy the buffers saved for the pause screen
	lda.w #$01FE
	jsl.l AllocWorkBuf
	sta.w PauseSpriteBackup
	tay
	lda.w #$0210
	jsl.l AllocWorkBuf
	lda.w #$01FD
	ldx.w #SpriteObjRAM
	mvn $7E,$7E
	lda.w #$020F
	ldx.w #PalSlotList
	mvn $7E,$7E
	rtl

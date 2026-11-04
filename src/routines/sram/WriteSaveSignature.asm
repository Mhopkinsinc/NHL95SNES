WriteSaveSignature:					; copies the cartridge header and vectors into a save signature slot
	ldx.w #$FFC0
	lda.w #$003F
	mvn $30,$C0
	rts

InitSaveRAM:						; checks the save signatures and initializes save RAM and defaults on
									; mismatch
	pea.w $7E30
	plb
	ldy.w #SRSignature1&$FFFF
	jsr.w CompareSaveSignature
	bne .1
	ldy.w #SRSignature2&$FFFF
	jsr.w CompareSaveSignature
	bne .1
	ldy.w #SRSignature3&$FFFF
	jsr.w CompareSaveSignature
	beq .2
.1:									; A = $1FFE, SRSignature1&$FFFF = 0, X = SRSignature1&$FFFF, Y = X, ...
	lda.w #$1FFE
	stz.w SRSignature1&$FFFF
	ldx.w #SRSignature1&$FFFF
	txy
	iny
	mvn $30,$30
	ldy.w #SRSignature1&$FFFF
	jsr.w WriteSaveSignature
	ldy.w #SRSignature2&$FFFF
	jsr.w WriteSaveSignature
	ldy.w #SRSignature3&$FFFF
	jsr.w WriteSaveSignature
	jsl.l InitSavedRosters
	lda.w #$0101
	sta.l SROptperlen
	lda.w #$000E
	sta.l SRHomeTeam
	lda.w #$0017
	sta.l SRVisTeam
	ldx.w #$003A
	lda.w #$FFFF
.loop:								; loop: SRUserNames,x = A, X - 1, X - 1, if the result >= 0 go to .loop
	sta.l SRUserNames,x
	dex
	dex
	bpl .loop
.2:									; return
	plb
	rtl

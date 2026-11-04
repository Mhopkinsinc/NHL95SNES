CompareSaveSignature:				; compares the save signature at Y against the cartridge header mirror
	ldx.w #$FFC0
.loop:								; loop: if $00,x is not $0000,y go to .rts, Y + 1, Y + 1, X + 1, ...
	lda.b $00,x
	cmp.w $0000,y
	bne .rts
	iny
	iny
	inx
	inx
	bne .loop
.rts:								; return
	rts

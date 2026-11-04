CheckIntroMirrorButtons:			; sets the intro mirror flag when all masked controller buttons are held
	and.w #$F0C0
	cmp.w #$F0C0
	bne .rts
	lda.w #$8000
	tsb.b d0+2
.rts:								; return
	rts

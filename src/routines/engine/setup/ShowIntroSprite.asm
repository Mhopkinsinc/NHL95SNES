ShowIntroSprite:					; reveals an intro sprite and applies horizontal flip when enabled
	lda.b $22,x
	ora.w #$0001
	sta.b $22,x
	bit.b d0+2
	bpl .rts
	lda.b $36,x
	ora.w #$4000
	sta.b $36,x
.rts:								; return
	rts

PositionIntroSprite:				; positions and hides an intro sprite, mirroring its horizontal position
									; when enabled
	bit.b d0+2
	bpl .1
	sec
	sbc.w #$0100
	eor.w #$FFFF
	inc a
.1:									; $05,x = A, A = Y, $08,x = A, A = $22,x, ...
	sta.b $05,x
	tya
	sta.b $08,x
	lda.b $22,x
	and.w #$FFFE
	sta.b $22,x
	rts

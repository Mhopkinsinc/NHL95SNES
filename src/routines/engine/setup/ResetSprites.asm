ResetSprites:						; ResetSpritesAt with the menu screens' tile area (tile $A0, $58 tiles),
									; for long calls
	lda.w #$00A0
	sta.b $E1
	lda.w #$0058
	sta.b $DD
	jsr.w ResetSpritesAt
	rtl

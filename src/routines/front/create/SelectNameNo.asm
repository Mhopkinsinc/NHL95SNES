SelectNameNo:						; Is the player name ok with No picked (d6 = 1): palette 3 on the Yes row
									; ($F), palette 0 on the No row ($12), the cursor placed
									; (PlaceYesNoCursor)
	lda.w #$0001
	sta.b d6
	lda.w #$000F
	jsr.w SetRowPalette3
	lda.w #$0012
	jsr.w SetRowPalette0
	bra PlaceYesNoCursorJump

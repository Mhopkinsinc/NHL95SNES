SelectNameYes:						; Is the player name ok with Yes picked (d6 = 0): palette 3 on the No row
									; ($12), palette 0 on the Yes row ($F), the cursor placed
									; (PlaceYesNoCursor)
	stz.b d6
	lda.w #$0012
	jsr.w SetRowPalette3
	lda.w #$000F
	jsr.w SetRowPalette0
PlaceYesNoCursorJump:				; jumps to PlaceYesNoCursor: the name question's shared tail
	jmp.w PlaceYesNoCursor

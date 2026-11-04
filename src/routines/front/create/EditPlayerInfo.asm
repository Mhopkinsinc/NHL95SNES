EditPlayerInfo:						; Create Player screen state 3: position, weight, number, hand (up / down
									; pick, left / right change); start goes on to the ratings page
									; (ModifyRatings), X cancels
	jsr.w PlayerInfoInput
	lda.b $26
	lsr a
	bcs .1
	jsl.l SendTextMap
.1:									; go to PlaceInfoCursor
	jmp.w PlaceInfoCursor

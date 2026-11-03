ModifyRatings:						; Create Player screen state 4: the goalie or skater ratings (up / down
									; pick, left / right change); start stores the player in save RAM
									; (SaveCreatedPlayer), X cancels
	jsr.w RatingsInput
	jsl.l SendTextMap
	rts

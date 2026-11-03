EnterLeagueMenu:					; FadeOutWait, the League Menu (SeasonOptions), then the front end loop
									; (ScreenStateLoop)
	jsl.l FadeOutWait
	jsr.w SeasonOptions
	bra ScreenStateLoop

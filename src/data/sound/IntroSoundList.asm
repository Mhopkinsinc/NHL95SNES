IntroSoundList:						; the sounds the intro loads (LoadSounds list; $FF ends it)
	db $13,$14,$15,$16,$11,$10,$09,$FF
	padbyte $CD						; unused to the end of the lower half
	pad $C08000

PlayModeOptionLists:				; per play mode (OptPlayMode * 2): its option list in bank $C3 for
									; DrawOptionList (modes 4 and 5 share one)
	dw ExhibitionOptions&$FFFF,PracticeOptions&$FFFF,SeasonOptionLines&$FFFF,TradeOptions&$FFFF
	dw FreeAgentOptions&$FFFF,FreeAgentOptions&$FFFF,MakePlayerOptions&$FFFF

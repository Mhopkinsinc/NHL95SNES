RosterColumnTable:					; the stat column routines by column ($7D * 2): RosterColStatus,
									; AttribEnergy, RosterColHand, RosterColWeight, none, RosterColRating
	dw RosterColStatus,AttribEnergy,RosterColHand,RosterColWeight
	dw $0000,RosterColRating

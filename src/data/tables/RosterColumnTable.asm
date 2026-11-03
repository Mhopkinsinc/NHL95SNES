RosterColumnTable:					; the stat column routines by column ($7D * 2): AttribStatus,
									; AttribEnergy, AttribHanded, AttribWeight, none, AttribRating
	dw AttribStatus,AttribEnergy,AttribHanded,AttribWeight
	dw $0000,AttribRating

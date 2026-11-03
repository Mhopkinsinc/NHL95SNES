GoalieRatingColumns:				; per goalie rating column (A * 4): d4 mask then RosterColumnTable offset
									; bits 12/13 select stick right/left, 14/15 glove right/left; bit 7 puck
									; control; other shared masks use the same byte/nibble order as skaters
	dw $0000,$0000,$F0C9,$000A,$0008,$000A,$0010,$000A
	dw $0200,$0004,$0040,$000A,$0080,$000A,$1000,$000A
	dw $2000,$000A,$4000,$000A,$8000,$000A,$0004,$0006

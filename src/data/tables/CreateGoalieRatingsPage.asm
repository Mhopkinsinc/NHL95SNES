CreateGoalieRatingsPage:			; Create Player's goalie ratings text page (position 0)
	dw $0018,$00A0,0,$0000
	dw TxtSpeed&$FFFF,$8008
	dw TxtAgility&$FFFF,$8009
	dw TxtDefAwareness&$FFFF,$800A
	dw TxtPuckControl&$FFFF,$800B
	dw TxtStickLeft&$FFFF,$800C
	dw TxtStickRight&$FFFF,$800D
	dw TxtGloveLeft&$FFFF,$800E
	dw TxtGloveRight&$FFFF,$800F
	dw TxtOverallRating&$FFFF,$A015
	dw TxtUnusedPoints&$FFFF,$A016
	dw TxtPadSelect&$FFFF,$8018
	dw TxtStartDone&$FFFF,$8019
	dw $FFFF,$00A8
	dw TxtXCancel&$FFFF,$8019
	dw 0

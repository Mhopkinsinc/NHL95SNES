CreatedPosNames:					; per created player position (d0 * 2): its name, packed text: Goalie,
									; then the five of PositionLongNames
	dw TxtGoalie&$FFFF,TxtLeftDefense&$FFFF,TxtRightDefense&$FFFF,TxtLeftWing&$FFFF,TxtCenter&$FFFF
	dw TxtRightWing&$FFFF

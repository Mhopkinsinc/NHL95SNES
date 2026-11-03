AvoidGoalHandlers:					; avdgoal's handler for each start code (AvoidGoal...)
	dw AvoidGoalInsideStart,AvoidGoalHighY,AvoidGoalRightSide,AvoidGoalRightHighY
	dw AvoidGoalLowY,$0000,AvoidGoalRightLowY,$0000
	dw AvoidGoalLeftSide,AvoidGoalLeftHighY,$0000,$0000
	dw AvoidGoalLeftLowY

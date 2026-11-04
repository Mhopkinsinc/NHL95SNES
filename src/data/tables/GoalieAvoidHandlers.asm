GoalieAvoidHandlers:				; AvoidGoalForGoalie's handler for each start code (GoalieAvoid...)
	dw GoalieAvoidInsideStart,GoalieAvoidHighY,GoalieAvoidRightSide,GoalieAvoidRightHighY
	dw GoalieAvoidLowY,$0000,GoalieAvoidRightLowY,$0000
	dw GoalieAvoidLeftSide,GoalieAvoidLeftHighY,$0000,$0000
	dw GoalieAvoidLeftLowY

DefensiveWingBottomLimit:			; limit the defensive wing target at the bottom goal line
	lda.w #$FEF2
	sta.b d2
	sec
	sbc.w pucky
	bmi DefensiveWingSkate
	bra DefensiveWingUseLimit

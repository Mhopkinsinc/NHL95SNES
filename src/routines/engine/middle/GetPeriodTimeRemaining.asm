GetPeriodTimeRemaining:				; called from other segments
	lda.w gsp
	xba
	and.w #$FF00
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	ora.w PerTimeTotal
	sec
	sbc.w gameclock
	sta.b d0
	rtl

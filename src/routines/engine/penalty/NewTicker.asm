NewTicker:							; shows the next ticker score (NewTicker2) once gameclock is below $1E1
	lda.w gameclock
	cmp.w #$01E1
	bcc NewTicker2
	rtl

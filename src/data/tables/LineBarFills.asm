LineBarFills:						; per energy third (energy * 3 / $1000, * 2): the routine that fills the
									; line's energy bar up to that tile (LineBarLow, LineBarMiddle,
									; LineBarHigh)
	dw LineBarLow,LineBarMiddle,LineBarHigh

LoadSeasonHomeRoster:				; LoadSeasonRoster of team A into HomeRoster, for long calls
	ldy.w #HomeRoster
	sta.b tmp0
	sty.b tmp1
	jsr.w LoadSeasonRoster
	rtl

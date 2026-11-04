findpcAssign:						; gives pad d4 to the best candidate through AssignPadPlayer
	sta.b d0
	jsl.l AssignPadPlayer
findpcReturn:						; restores the saved d0 through d3 words and returns from findpc
	pla
	sta.b d3+2
	pla
	sta.b d3
	pla
	sta.b d2+2
	pla
	sta.b d2
	pla
	sta.b d1+2
	pla
	sta.b d1
	pla
	sta.b d0+2
	pla
	sta.b d0
	rtl

FillPlayerAssignments:				; fill the player assignment ring with d0 and advance X
	stx.w puckc
	jsl.l assinsert
	jsl.l assinsert
	jsl.l assinsert
	jsl.l assinsert
	jsl.l assinsert
	jsl.l assinsert
	jsl.l assinsert
	jsl.l assinsert
	inx
	inx
	rtl

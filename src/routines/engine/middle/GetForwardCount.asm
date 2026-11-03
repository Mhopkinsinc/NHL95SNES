GetForwardCount:					; d0 = the forward count of team a2 (+4 of its roster table); no caller
									; found
	ldx.w #HomeRoster
	lda.b a2
	beq .1
	ldx.w #VisRoster
.1:									; d0 = $0004,x, return
	lda.w $0004,x
	sta.b d0
	rtl

GetPlayerCount:						; returns team a2 roster count in d0
	ldy.w #HomeRoster
	lda.b a2
	beq .1
	ldy.w #VisRoster
.1:									; d0 = $0000,y, return
	lda.w $0000,y
	sta.b d0
	rtl

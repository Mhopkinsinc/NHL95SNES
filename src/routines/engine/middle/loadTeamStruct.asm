loadTeamStruct:						; from SetLCmode and other segments
	lda.w pfteam,x
	beq .1
	stz.b a1
	lda.w #$0002
	sta.b a2
	rtl
.1:									; a1 = $0002, a2 = 0, return
	lda.w #$0002
	sta.b a1
	stz.b a2
	rtl
	rtl								; unreached: no code branches, falls or points here

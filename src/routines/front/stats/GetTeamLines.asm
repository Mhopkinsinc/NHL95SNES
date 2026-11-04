GetTeamLines:						; from SetPlList and other segments
	lda.w #$007E
	sta.b a3+2
	lda.b a2
	beq .1
	lda.w #$1813
	bra .2
.1:									; A = $17DB
	lda.w #$17DB
.2:									; a3 = A, return
	sta.b a3
	rtl

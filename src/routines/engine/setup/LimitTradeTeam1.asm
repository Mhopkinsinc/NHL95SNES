LimitTradeTeam1:					; the Trades screen Team 1 line's check: HomeTeam kept among the 26 NHL
									; teams (wrapping) and stepped once more when it equals VisTeam, then
									; LimitHomeTeam
	lda.w HomeTeam
	cmp.w #$001A
	bcc .3
	beq .1
	lda.w #$0019
	bra .2
.1:									; A = $0000
	lda.w #$0000
.2:									; HomeTeam = A
	sta.w HomeTeam
.3:									; if A is not VisTeam go to LimitHomeTeam, A = padchangeany, ...
	cmp.w VisTeam
	bne LimitHomeTeam
	lda.w padchangeany
	bit.w #$0200
	beq .5
	lda.w HomeTeam
	dec a
	bpl .4
	lda.w #$0019
.4:									; HomeTeam = A, go to LimitHomeTeam
	sta.w HomeTeam
	bra LimitHomeTeam
.5:									; A = HomeTeam, A + 1, if A < $001A go to .4, A = $0000, ...
	lda.w HomeTeam
	inc a
	cmp.w #$001A
	bcc .4
	lda.w #$0000
	bra .4

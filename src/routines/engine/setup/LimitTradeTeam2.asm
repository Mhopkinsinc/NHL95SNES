LimitTradeTeam2:					; the Trades screen Team 2 line's check: VisTeam kept among the 26 NHL
									; teams (wrapping) and stepped once more when it equals HomeTeam, then
									; LimitVisTeam
	lda.w VisTeam
	cmp.w #$001A
	bcc .3
	beq .1
	lda.w #$0019
	bra .2
.1:									; A = $0000
	lda.w #$0000
.2:									; VisTeam = A
	sta.w VisTeam
.3:									; if A is not HomeTeam go to LimitVisTeam, A = padchangeany, ...
	cmp.w HomeTeam
	bne LimitVisTeam
	lda.w padchangeany
	bit.w #$0200
	beq .5
	lda.w VisTeam
	dec a
	bpl .4
	lda.w #$0019
.4:									; VisTeam = A, go to LimitVisTeam
	sta.w VisTeam
	bra LimitVisTeam
.5:									; A = VisTeam, A + 1, if A < $001A go to .4, A = $0000, ...
	lda.w VisTeam
	inc a
	cmp.w #$001A
	bcc .4
	lda.w #$0000
	bra .4

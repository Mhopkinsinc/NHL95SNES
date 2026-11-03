AskNameOk:							; Is the player name ok: up / down Yes / No; start: No starts over
									; (CreatePlayer), Yes draws the position, weight, number and hand page
									; (screen state 3)
	lda.w repeatdelayframes
	beq .1
	rts
.1:									; A = padchangeany, if a $0400 bit set go to SelectNameNo, ...
	lda.w padchangeany
	bit.w #$0400
	bne SelectNameNo
	bit.w #$0800
	bne SelectNameYes
	bit.w #$1000
	bne AnswerNameOk
	rts

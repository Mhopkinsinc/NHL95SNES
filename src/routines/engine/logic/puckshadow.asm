puckshadow:							; assignment (asstab entry 25): the puck shadow (object 15): under the
									; puck when the puck frame is SPFpuck, else at a fixed spot flipped by the
									; puck's end
	lda.w frame+$1E
	cmp.w frame+$3E
	beq .1
	phx
.loop:								; loop: if TransfersReady is not 0 go to .loop, tmp2 = $2580, ...
	ldx.w TransfersReady
	bne .loop
	ldx.w #$2580
	stx.b tmp2
	ldx.w #$2035
	stx.b tmp1
	sta.w frame+$3E
	jsl.l QueueFrameTiles
	plx
	lda.w frame+$1E
.1:									; if A is not SPFpuck go to .2, Xpos+$1E = puckx, A = pucky, A + 1, ...
	cmp.w #SPFpuck
	bne .2
	lda.w puckx
	sta.w Xpos+$1E
	lda.w pucky
	inc a
	sta.w Ypos+$1E
	rtl
.2:									; Y = A, if the result = 0 go to .rtl, Xpos+$1E = $0030, A = $0133, ...
	tay
	beq .rtl
	lda.w #$0030
	sta.w Xpos+$1E
	lda.w #$0133
	bit.w pucky
	bpl .3
	lda.w #$8000
	sta.w attribute+$1E
	lda.w #$FEAF
.3:									; Ypos+$1E = A
	sta.w Ypos+$1E
.rtl:								; return
	rtl

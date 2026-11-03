BuildSimPickTable:					; the pick table of players SimPickFirst up to SimPickEnd: each weighs 2 ^
									; (n - 1), n the low nibble of his roster byte + $112, running sums in
									; SimTable by player
	stz.w SimPickIndex
	stz.w SimPickTotal
	lda.w SimPickFirst
.loop:								; loop: A * 2, A * 2, A * 2, A * 2, ...
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w #$0112
	tay
	lda.b [p0],y
	and.w #$000F
	tay
	lda.w #$0000
	sec
.loop2:								; loop: Y - 1, if the result is not 0 go to .loop2, X = SimPickIndex, ...
	rol a
	dey
	bne .loop2
	ldx.w SimPickIndex
	clc
	adc.w SimPickTotal
	sta.w SimPickTotal
	sta.w SimTable,x
	lda.w SimPickFirst
	sta.w SimTable+$2,x
	inx
	inx
	inx
	inx
	stx.w SimPickIndex
	inc a
	sta.w SimPickFirst
	cmp.w SimPickEnd
	bne .loop
	rts

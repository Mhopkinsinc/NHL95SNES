FillWords7E:						; fills d3 words of bank $7E from A with Y
	tax
	tya
	ldy.b d3
.loop:								; loop: $7E0000,x = A, X + 1, X + 1, Y - 1, ...
	sta.l $7E0000,x
	inx
	inx
	dey
	bne .loop
	rtl

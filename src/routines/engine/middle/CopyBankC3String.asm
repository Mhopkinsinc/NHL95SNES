CopyBankC3String:					; copies the zero ended string at A in bank $C3 to Y, the zero too; no
									; caller found
	tax
	phb
	sep #$20
.loop:								; loop: if $C30000,x = 0 go to .1, $0000,y = A, X + 1, Y + 1, ...
	lda.l $C30000,x
	beq .1
	sta.w $0000,y
	inx
	iny
	bra .loop
.1:									; $0000,y = A, A 16-bit, return
	sta.w $0000,y
	rep #$20
	rtl

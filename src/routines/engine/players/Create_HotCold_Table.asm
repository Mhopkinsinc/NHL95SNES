Create_HotCold_Table:				; called from other segments
	ldx.w #$026F
.1:									; A = $000E, call randoma8, if A < $000D go to .2, A = $000C
	lda.w #$000E
	jsl.l randoma8
	cmp.w #$000D
	bcc .2
	lda.w #$000C
.2:									; Y = A, A = seed, if the result is not 0 go to .3, A 8-bit, ...
	tay
	lda.w seed
	and.w #$0010
	bne .3
	sep #$20
	tya
	eor.b #$FF
	inc a
	sta.w HotColdTable,x
	bra .4
.3:									; A 8-bit, A = Y, HotColdTable,x = A
	sep #$20
	tya
	sta.w HotColdTable,x
.4:									; A 16-bit, X - 1, if the result >= 0 go to .1, return
	rep #$20
	dex
	bpl .1
	rtl

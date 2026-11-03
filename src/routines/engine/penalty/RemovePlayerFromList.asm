RemovePlayerFromList:				; remove a player from the penalty box list by shifting later entries down
	lda.w #$FFFF
	sta.b d2
.loop:								; loop: d2 + 1, A = a0, A + d2, Y = A, ...
	inc.b d2
	lda.b a0
	clc
	adc.b d2
	tay
	sep #$20
	lda.w tmboxlist,y
	sta.w tmboxlist-1,y
	rep #$30
	bit.w #$0080
	beq .loop
	dec.b a0
	rtl

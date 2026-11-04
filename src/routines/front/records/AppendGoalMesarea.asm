AppendGoalMesarea:					; copies the zero ended string at X to mesarea + Y (no zero after it); Y =
									; its end
	sep #$20
.loop:								; loop: if $0000,x = 0 go to .1, mesarea,y = A, X + 1, Y + 1, ...
	lda.w $0000,x
	beq .1
	sta.w mesarea,y
	inx
	iny
	bra .loop
.1:									; A 16-bit, return
	rep #$20
	rts

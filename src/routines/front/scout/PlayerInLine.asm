PlayerInLine:						; carry set (and Z) when player A is in one of the five line slots at +$6D
									; .. +$71 of the roster table at Y
	cmp.w $006D,y
	beq .rts
	cmp.w $006E,y
	beq .rts
	cmp.w $006F,y
	beq .rts
	cmp.w $0070,y
	beq .rts
	cmp.w $0071,y
	beq .rts
	clc
.rts:								; return
	rts

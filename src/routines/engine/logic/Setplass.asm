Setplass:							; from forcepldata and other segments
	lda.w position,x
	sta.b d0
	bmi .rtl
	lda.w #PositionAssignments>>16
	sta.b a0+2
	lda.w #PositionAssignments&$FFFF
	sta.b a0
	ldy.b d0
	lda.b [a0],y
	and.w #$00FF
	sta.b d0
	jml.l assreplace
.rtl:								; return
	rtl

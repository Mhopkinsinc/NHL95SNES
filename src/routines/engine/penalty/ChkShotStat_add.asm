ChkShotStat_add:					; no caller found (not traced)
	ldy.b d1
	lda.w pfteam,x
	beq .1
	iny
	iny
.1:									; A = $0000,y, A + d0, $0000,y = A, return
	lda.w $0000,y
	clc
	adc.b d0
	sta.w $0000,y
	rtl

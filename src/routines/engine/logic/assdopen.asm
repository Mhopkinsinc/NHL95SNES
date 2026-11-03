assdopen:							; from SeatPenaltyBox and other segments
	lda.w #$0010
	sta.b d0
	lda.w pfteam,x
	beq .1
	lda.w #$0001
	sta.b d0
.1:									; A = PBnum, A + d0, PBnum = A, position,x = $FFFF, ...
	lda.w PBnum
	clc
	adc.b d0
	sta.w PBnum
	lda.w #$FFFF
	sta.w position,x
	lda.w attribute,x
	and.w #$F7FF
	sta.w attribute,x
	lda.w #SPFPen+6
	sta.w frame,x
	rtl

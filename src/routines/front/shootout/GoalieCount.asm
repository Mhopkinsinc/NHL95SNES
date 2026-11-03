GoalieCount:						; count the goalie odds nibbles for team a2 into d0
	ldy.b a2
	stz.b d0
	lda.w #$00C3
	sta.b tmp1
	lda.w tmdata,y
	sta.b tmp0
	ldy.w #$0008
	clc
	adc.b [tmp0],y
	sta.b tmp0
	lda.b [tmp0]
	xba
.loop:								; loop: d0 + 1, A * 2, A * 2, A * 2, ...
	inc.b d0
	asl a
	asl a
	asl a
	asl a
	bne .loop
	rtl

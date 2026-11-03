AdvanceBreakawayPath:				; load the next breakaway waypoint and its advance threshold
	lda.w sopathpoint
	asl a
	adc.w sopathpoint
	asl a
	tay
	lda.w #BreakawayPathPoints>>16
	sta.b a0+2
	lda.w #BreakawayPathPoints
	sta.b a0
	lda.b [a0],y
	sta.b d0
	lda.w sopathside
	bpl .1
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
.1:									; sopathx = d0, Y + 1, Y + 1, sopathy = [a0],y, ...
	lda.b d0
	sta.w sopathx
	iny
	iny
	lda.b [a0],y
	sta.w sopathy
	iny
	iny
	lda.b [a0],y
	sta.w sopathnext
	inc.w sopathpoint
	rts

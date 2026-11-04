TagReplayPoint:						; the replay camera's free cursor point (PadControlObj $10, object 16): no
									; roster number, the marks $0C right and $14 up, then TagReplayMarker
	lda.b $0A
	clc
	adc.w #$000C
	sta.b $0A
	lda.b $0C
	sec
	sbc.w #$0014
	sta.b $0C
TagReplayMarker:					; the replay camera cursor's marker (tag slot $0C): the four corner marks,
									; SPFreplay, through DrawFrameLayout, then PadTagFrameDone
	lda.w #$2454
	sta.b tmp1
	lda.w #$25E0
	sta.b tmp2
	lda.b $0A
	clc
	adc.w #$0028
	sta.b $0A
	lda.b $0C
	clc
	adc.w #$0010
	sta.b $0C
	lda.w #PadTagFrameDoneJump&$FFFF
	sta.b tmp3
	ldy.b $2A
	lda.w #SPFreplay
	jml.l DrawFrameLayout

RenderReplayFrame:					; build the replay frame sprites and queue display updates
	lda.w ReplayGameframes
	sta.b gameframes
	sta.b $26
	jsl.l updatescroll
	jsl.l DrawPlayerTags
	lda.w frame+$1E
	cmp.w frame+$3E
	beq .1
	ldx.w #$2580
	stx.b tmp2
	ldx.w #$2035
	stx.b tmp1
	sta.w frame+$3E
	jsl.l QueueFrameTiles
.1:									; call UpdateGameObjectSprites, call PackOAMHigh, TransfersReady + 1, ...
	jsl.l UpdateGameObjectSprites
	jsl.l PackOAMHigh
	inc.w TransfersReady
	jsl.l showref
	jsl.l updatescroll_rows
	ldx.b a3
	rtl

RestartScoutingText:				; deletes the scroll sprites and restarts the scouting commentary
	ldx.b $77
	jsl.l DeleteSprite
	ldx.b $79
	jsl.l DeleteSprite
InitScoutingDisplay:				; resets the scouting text pointer, cursor and scrolling display
	lda.b $7B
	sta.b $7D
	lda.w #$0012
	sta.w ScoutTextRow
	lda.w #$0002
	sta.w ScoutTextCol
	lda.w #$0010
	sta.b d5+2
	stz.b d5
	stz.b a1+2
	stz.b a1+2
	lda.b $D3
	clc
	adc.w #$0440
	ldy.w #$02C0
	jsl.l ClearRAM7E
	jsl.l SendTextMap
	jsl.l WaitTransfers
	lda.w #$5C11
	ldx.w #$0008
	ldy.w #$0012
	jsl.l StartScrollListLong
	ldx.b $77
	lda.b $22,x
	and.w #$FFFE
	sta.b $22,x
	ldx.b $79
	lda.b $22,x
	and.w #$FFFE
	sta.b $22,x
	rts

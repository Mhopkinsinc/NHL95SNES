NextScoutTextLine:					; resets the scouting text column and advances or scrolls the text row
	lda.w #$0002
	sta.w ScoutTextCol
	lda.w #$0010
	sta.b d5+2
	lda.w ScoutTextRow
	inc a
	cmp.w #$001A
	bcc .1
	inc.b d5
.1:									; if A < $001B go to .2, A = $0011
	cmp.w #$001B
	bcc .2
	lda.w #$0011
.2:									; ScoutTextRow = A, if d5 = 0 go to .rts, push X, ...
	sta.w ScoutTextRow
	lda.b d5
	beq .rts
	phx
	jsl.l ScrollListDownLong
	jsl.l WaitTransfers
	plx
.rts:								; return
	rts

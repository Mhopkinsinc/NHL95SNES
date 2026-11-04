UpdateCoincidentalPenalty:			; tick a coincidental penalty and advance or finish its timed state
	dec a
	sta.w tmpdst,y
	bit.w #$0800
	bne .1
	jmp.w UpdatePenaltyListEntry
.1:									; if a $1000 bit set go to .2, tmpdst,y = $1000, ...
									; RemovePlayerFromList
	bit.w #$1000
	bne .2
	lda.w #$1000
	sta.w tmpdst,y
	jml.l RemovePlayerFromList
.2:									; tmpdst,y = $0000, go to RemovePlayerFromList
	lda.w #$0000
	sta.w tmpdst,y
	jml.l RemovePlayerFromList

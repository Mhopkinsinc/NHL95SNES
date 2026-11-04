AddRosterPlayer:					; adds player tmp2 to the roster table at tmp1: the count + 1, its index
									; at +$3A and its PlayerList id at +8
	phx
	lda.b (tmp1)
	inc a
	sta.b (tmp1)
	lda.b tmp2
	sta.w $003A,y
	asl a
	tax
	lda.l PlayerList,x
	and.w #$3FFF
	sta.w $0008,y
	iny
	iny
	plx
	rts

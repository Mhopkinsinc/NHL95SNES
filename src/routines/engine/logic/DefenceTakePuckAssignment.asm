DefenceTakePuckAssignment:			; insert the puck carrier assignment for the defender
	lda.w #$0011
	sta.b d0
	jmp.w assinsert

InsertByAssists:					; AddLeaderEntry for category 1: links entry Y into the list at d0 in
									; order of +$A (assists; a goalie's shots)
	lda.w $000A,y
	sta.b tmp1
	lda.b d0
.loop:								; loop: X = A, if $000A,x >= tmp1 go to LinkLeaderBefore, ...
	tax
	lda.w $000A,x
	cmp.b tmp1
	bcs LinkLeaderBefore
	lda.w $0000,x
	bne .loop
	bra LinkLeaderLast

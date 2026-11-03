InsertByPoints:						; AddLeaderEntry for category 2: links entry Y into the list at d0 in
									; order of +$C (points; a goalie's save percentage)
	lda.w $000C,y
	sta.b tmp1
	lda.b d0
.loop:								; loop: X = A, if $000C,x >= tmp1 go to LinkLeaderBefore, ...
	tax
	lda.w $000C,x
	cmp.b tmp1
	bcs LinkLeaderBefore
	lda.w $0000,x
	bne .loop
	bra LinkLeaderLast

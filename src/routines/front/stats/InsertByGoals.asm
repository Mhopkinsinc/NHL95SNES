InsertByGoals:						; AddLeaderEntry for category 0: links entry Y into the list at d0 in
									; order of +8 (goals; a goalie's saves)
	lda.w $0008,y
	sta.b tmp1
	lda.b d0
.loop:								; loop: X = A, if $0008,x >= tmp1 go to LinkLeaderBefore, ...
	tax
	lda.w $0008,x
	cmp.b tmp1
	bcs LinkLeaderBefore
	lda.w $0000,x
	bne .loop
LinkLeaderLast:						; links leader entry Y after X as the list's last ($81 = Y)
	sty.b d0+2
	tya
	sta.w $0000,x
	txa
	tyx
	stz.w $0000,x
	sta.w $0002,y
	rts

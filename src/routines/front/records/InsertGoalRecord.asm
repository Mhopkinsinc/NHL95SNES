InsertGoalRecord:					; puts user record tmp1 in the goal page's order list before the first one
									; whose goals are not above A (the rest moved down); X = tmp1
	ldy.w #$0000
.loop:								; loop: if ListBuf+$10,y < 0 go to .2, ...
	ldx.w ListBuf+$10,y
	bmi .2
	cmp.w ScratchBuf+$2,x
	bcs .1
	iny
	iny
	cpy.w #$000E
	bcc .loop
.1:									; push Y, Y = ListBuf+$1F, X = ListBuf+$1D, A = $000D, ...
	phy
	ldy.w #ListBuf+$1F
	ldx.w #ListBuf+$1D
	sec
	lda.w #$000D
	sbc.b $01,s
	mvp $7E,$7E
	ply
.2:									; ListBuf+$10,y = tmp1, X = A, return
	lda.b tmp1
	sta.w ListBuf+$10,y
	tax
	rts

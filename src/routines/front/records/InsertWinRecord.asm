InsertWinRecord:					; puts user record tmp1 in the win page's order list before the first one
									; whose win % is not above A (the rest moved down); X = tmp1
	ldy.w #$0000
.loop:								; loop: if ListBuf,y < 0 go to .2, if A >= ScratchBuf+$10,x go to .1, ...
	ldx.w ListBuf,y
	bmi .2
	cmp.w ScratchBuf+$10,x
	bcs .1
	iny
	iny
	cpy.w #$000E
	bcc .loop
.1:									; push Y, Y = ListBuf+$F, X = ListBuf+$D, A = $000D, ...
	phy
	ldy.w #ListBuf+$F
	ldx.w #ListBuf+$D
	sec
	lda.w #$000D
	sbc.b $01,s
	mvp $7E,$7E
	ply
.2:									; ListBuf,y = tmp1, X = A, return
	lda.b tmp1
	sta.w ListBuf,y
	tax
	rts

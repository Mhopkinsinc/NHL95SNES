InsertSaveRecord:					; puts user record tmp1 in the save page's order list before the first one
									; whose saves are not above A (the rest moved down); X = tmp1
	ldy.w #$0000
.loop:								; loop: if ListBuf+$20,y < 0 go to .2, ...
	ldx.w ListBuf+$20,y
	bmi .2
	cmp.w ScratchBuf+$6,x
	bcs .1
	iny
	iny
	cpy.w #$000E
	bcc .loop
.1:									; push Y, Y = ListBuf+$2F, X = ListBuf+$2D, A = $000D, ...
	phy
	ldy.w #ListBuf+$2F
	ldx.w #ListBuf+$2D
	sec
	lda.w #$000D
	sbc.b $01,s
	mvp $7E,$7E
	ply
.2:									; ListBuf+$20,y = tmp1, X = A, return
	lda.b tmp1
	sta.w ListBuf+$20,y
	tax
	rts

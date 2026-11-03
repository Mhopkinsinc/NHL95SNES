StartScrollRowDrawn:				; a row drawn for StartScrollList: WaitTransfers, RestoreWorkBuf, the next
									; row while rows and window last, then ScrollListArrows
	jsl.l WaitTransfers
	jsl.l RestoreWorkBuf
	inc.b a2+2
	inc.b a3
	lda.b a3
	cmp.b a1
	bcs ScrollListArrows
	dec a
	cmp.b a3+2
	bcc StartScrollRowNext
ScrollListArrows:					; a scrolling list each frame: its up arrow sprite shown when rows are
									; above, the down arrow when rows are below
	ldx.b $77
	lda.b $22,x
	ldy.b a1+2
	beq .1
	ora.w #$0001
	bra .2
.1:									; A and $FFFE
	and.w #$FFFE
.2:									; $22,x = A, X = $79, A = Y, A + a3+2, ...
	sta.b $22,x
	ldx.b $79
	tya
	clc
	adc.b a3+2
	tay
	lda.b $22,x
	cpy.b a1
	bcs .3
	ora.w #$0001
	bra .4
.3:									; A and $FFFE
	and.w #$FFFE
.4:									; $22,x = A, return
	sta.b $22,x
	rts

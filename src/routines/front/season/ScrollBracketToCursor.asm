ScrollBracketToCursor:				; moves the bracket's scroll position ($65) toward the cursor column's
									; (BracketColumnScroll): one step when near, a larger one when far, the
									; map columns queued
	lda.b a1
	asl a
	tax
	sec
	lda.l BracketColumnScroll,x
	sbc.b a0+2
	beq .4
	sta.b tmp0
	bpl .1
	eor.w #$FFFF
	inc a
.1:									; if A >= $0008 go to .2, A = $0001, if plus go to .3, A = $FFFF, ...
	cmp.w #$0008
	bcs .2
	lda.w #$0001
	bit.b tmp0
	bpl .3
	lda.w #$FFFF
	bra .3
.2:									; A = tmp0, A / 2, A / 2, A / 2, ...
	lda.b tmp0
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq .3
	ora.w #$E000
.3:									; A + a0+2, a0+2 = A
	clc
	adc.b a0+2
	sta.b a0+2
.4:									; if BG2HScroll is not a0+2 go to .5, return
	lda.w BG2HScroll
	cmp.b a0+2
	bne .5
	rts
.5:									; A and $FFF8, tmp1 = A, A = a0+2, A and $FFF8, ...
	and.w #$FFF8
	sta.b tmp1
	lda.b a0+2
	sec
	and.w #$FFF8
	sbc.b tmp1
	bpl .6
	eor.w #$FFFF
	inc a
	lsr a
	lsr a
	lsr a
	beq .7
	sta.b tmp1
.loop:								; loop: a0 - 1, tmp0 = 0, call QueueBracketColumn, tmp1 - 1, ...
	dec.b a0
	stz.b tmp0
	jsr.w QueueBracketColumn
	dec.b tmp1
	bne .loop
	bra .7
.6:									; A / 2, A / 2, A / 2, if the result = 0 go to .7, ...
	lsr a
	lsr a
	lsr a
	beq .7
	sta.b tmp1
.loop2:								; loop: a0 + 1, tmp0 = $0020, call QueueBracketColumn, tmp1 - 1, ...
	inc.b a0
	lda.w #$0020
	sta.b tmp0
	jsr.w QueueBracketColumn
	dec.b tmp1
	bne .loop2
.7:									; BG2HScroll = a0+2, return
	lda.b a0+2
	sta.w BG2HScroll
	rts

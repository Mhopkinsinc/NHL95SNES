ShowPenaltyBox:						; the players in the penalty box list at tmboxlist + A (bit 7 ends it):
									; those with tmpdst bit 14 clear first, then those with it set
									; (ShowPenaltyBoxPlayer)
	pha
	tay
	asl a
	sta.b tmp3
.loop:								; loop: A = tmboxlist,y, Y + 1, A and $00FF, ...
	lda.w tmboxlist,y
	iny
	and.w #$00FF
	bit.w #$0080
	bne .1
	clc
	adc.b tmp3
	tax
	lda.w tmpdst,x
	bit.w #$4000
	bne .loop
	jsr.w ShowPenaltyBoxPlayer
	bra .loop
.1:									; pull Y
	ply
.loop2:								; loop: A = tmboxlist,y, Y + 1, A and $00FF, ...
	lda.w tmboxlist,y
	iny
	and.w #$00FF
	bit.w #$0080
	bne rtsmenu
	clc
	adc.b tmp3
	tax
	lda.w tmpdst,x
	bit.w #$4000
	beq .loop2
	jsr.w ShowPenaltyBoxPlayer
	bra .loop2

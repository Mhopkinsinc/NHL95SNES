prefmes:							; the message for penalty d0 (negative: none): penmsgbox cleared, then its
									; text from Penaltylist in a frame (with the player's short name in
									; horizontal mode); penmsgbox = 1
	lda.w penmsgbox
	beq .1
	stz.w penmsgbox
.1:									; if d0 >= 0 go to .2, return
	ldx.b d0
	bpl .2
	rtl
.2:									; A = Penaltylist,x, X = A, A = Penaltylist+2,x, A and $00FF, ...
	lda.l Penaltylist,x
	tax
	lda.l Penaltylist+2,x
	and.w #$00FF
	dec a
	beq .rtl
	phx
	ldx.w sfhormode
	beq .3
	jsl.l CloseLCBoxes
	ldx.w #$0012
	ldy.w #$0003
	lda.w #$584A
	jsl.l Framer
	jsl.l RosterPlayerShortName
	ldy.w #$588B
	jsl.l QueueVRAMDMALen
	ldy.w #$586B
	bra .4
.3:									; X = A, X + 1, X + 1, X + 1, ...
	tax
	inx
	inx
	inx
	txa
	asl a
	sta.w RefMessageWidth
	ldy.w #$0002
	lda.w #$5941
	jsl.l Framer
	ldy.w #$5962
.4:									; pull A, A + $449B, X = $00C3, call QueueVRAMDMALen, ...
	pla
	clc
	adc.w #$449B
	ldx.w #$00C3
	jsl.l QueueVRAMDMALen
	lda.w #$0001
	sta.w penmsgbox
.rtl:								; return
	rtl

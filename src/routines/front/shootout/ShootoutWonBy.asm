ShootoutWonBy:						; jumps to its end at once: the shootout check after it is not reached
	jmp.w .6
	lda.w shootoutmode
	bne .1
	jmp.w .6
.1:									; d0 = $000A, if shootoutdecider is not 0 go to .2, go to .6
	lda.w #$000A
	sta.b d0
	lda.w shootoutdecider
	bne .2
	jmp.w .6
.2:									; A = tmscore, A - tmscore+2, if the result is not 0 go to .3, go to .6
	lda.w tmscore
	sec
	sbc.w tmscore+2
	bne .3
	jmp.w .6
.3:									; push X, push Y, A = tmscore, A - tmscore+2, ...
	phx
	phy
	pei ($83)
	pei ($67)
	lda.w tmscore
	sec
	sbc.w tmscore+2
	bmi .4
	ldy.w #$0000
	bra .5
.4:									; Y = $0002
	ldy.w #$0002
.5:									; push Y, A = HomeTeam,y, A * 2, X = A, ...
	phy
	brk #$00						; a brk in the ROM
	lda.w HomeTeam,y
	asl a
	tax
	lda.l $C30000,x
	tax
	lda.l $C30002,x
	tax
	jsl.l UnpackText
	jsl.l CopyLenString2
	phx
	ldx.w #$0010
	ldy.w #$0004
	lda.w #$5850
	jsl.l Framer
	pla
	ldx.w #$007E
	ldy.w #$5871
	jsl.l QueueVRAMDMALen
	lda.w #$5F17
	ldx.w #$00C3
	ldy.w #$5891
	jsl.l QueueVRAMDMALen
	pla
	sta.b a1
	pla
	sta.b d1
	ply
	plx
	lda.w #$0010
	sta.b d0
.6:									; go to AddPenalty2
	jml.l AddPenalty2

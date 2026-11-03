MarkFreeAgentLimits:				; sets bit $80 in the flags (ScratchBuf) of each free agent whose group is
									; full (3 goalies, 15 defense or forwards, 25 players: d0, d1, $81) and
									; clears it on the others
	ldx.w #$0000
.1:									; a3 = X, a0+2 = X, call FindFreeAgent, if A >= $026A go to .4, ...
	stx.b a3
	stx.b a0+2
	jsr.w FindFreeAgent
	cmp.w #$026A
	bcs .4
	stz.b tmp0
	asl a
	tax
	lda.l PlayerList,x
	bmi .3
	bit.w #$4000
	bne .2
	ldx.b a3
	bra .5
.2:									; X = a3, tmp0 = $0001, go to .7
	ldx.b a3
	lda.w #$0001
	sta.b tmp0
	bra .7
.3:									; tmp0 = $0003, X = a3, go to .8
	lda.w #$0003
	sta.b tmp0
	ldx.b a3
	bra .8
.4:									; call CreatedPlayerBits, call NextSaveBits3, tmp0 = A, X = a3, ...
	jsr.w CreatedPlayerBits
	jsr.w NextSaveBits3
	sta.b tmp0
	ldx.b a3
	cmp.w #$0000
	bne .6
.5:									; if d0 < $0003 go to .10, go to .9
	lda.b d0
	cmp.w #$0003
	bcc .10
	bra .9
.6:									; if A >= $0003 go to .8
	cmp.w #$0003
	bcs .8
.7:									; if d1 < $000F go to .10, go to .9
	lda.b d1
	cmp.w #$000F
	bcc .10
	bra .9
.8:									; if d0+2 < $000F go to .10
	lda.b d0+2
	cmp.w #$000F
	bcc .10
.9:									; A = $0080, A or ScratchBuf,x, A or tmp0, ScratchBuf,x = A, ...
	lda.w #$0080
	ora.w ScratchBuf,x
	ora.b tmp0
	sta.w ScratchBuf,x
	bra .11
.10:								; A = d0, A + d1, A + d0+2, if A >= $0019 go to .9, ...
	lda.b d0
	clc
	adc.b d1
	adc.b d0+2
	cmp.w #$0019
	bcs .9
	lda.w ScratchBuf,x
	and.w #$FF7F
	ora.b tmp0
	sta.w ScratchBuf,x
.11:								; X + 1, if X = a1 go to .rts, go to .1
	inx
	cpx.b a1
	beq .rts
	jmp.w .1
.rts:								; return
	rts

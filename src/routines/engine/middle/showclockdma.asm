showclockdma:						; puts the game clock (clockbcd as M:SS, no leading zero) in the
									; scoreboard text and queues it to VRAM
	lda.w #$A0A0
	sta.l $7E2CD0
	sta.l $7E2CD5
	lda.w #$A005
	sta.l $7E2CCF
	sep #$21
	lda.b #$BA
	sta.l $7E2CD2
	lda.w clockbcd+1
	tay
	and.b #$F0
	beq .1
	lsr a
	lsr a
	lsr a
	lsr a
	adc.b #$B0
	sta.l $7E2CD0
	sec
.1:									; A = Y, A and $0F, A + $AF, $7E2CD1 = A, ...
	tya
	and.b #$0F
	adc.b #$AF
	sta.l $7E2CD1
	lda.w clockbcd
	tay
	lsr a
	lsr a
	lsr a
	lsr a
	clc
	adc.b #$B0
	sta.l $7E2CD3
	tya
	and.b #$0F
	adc.b #$B0
	sta.l $7E2CD4
	rep #$30
	ldy.w #$5B24
	lda.w #$2CCF
	ldx.w #$007E
	jml.l QueueVRAMDMALen

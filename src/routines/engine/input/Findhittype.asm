Findhittype:						; from SetShotMode, dopass_swing, PassReceiverOneTimer, ...
	lda.b d0
	eor.w #$FFFF
	inc a
	clc
	adc.w facedir,x
	and.w #$0007
	sta.b d0
	lda.w attribute,x
	bit.w #$0800
	beq .1
	phx
	ldx.b d0
	lda.l HitTypes,x
	plx
	and.w #$00FF
	rtl
.1:									; push X, X = d0, A = HitTypes+3,x, pull X, ...
	phx
	ldx.b d0
	lda.l HitTypes+3,x
	plx
	and.w #$00FF
	rtl

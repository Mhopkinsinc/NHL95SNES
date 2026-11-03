InProgress_ap:						; from chkprogress and other segments
	lda.w #$0006
	sta.b d1
	lda.w #$0032
	sta.b d0
.loop:								; loop: if a2 = 0 go to .1, A = $0034
	lda.b a2
	beq .1
	lda.w #$0034
.1:									; A + d0, Y = A, if tmpdst,y < 0 go to .2, if zero go to .2, ...
	clc
	adc.b d0
	tay
	lda.w tmpdst,y
	bmi .2
	beq .2
	and.w #$DFFF
	sta.w tmpdst,y
	bit.w #$5000
	bne .2
	lda.b d1
	cmp.w #$0004
	beq .2
	dec.b d1
.2:									; d0 - 1, d0 - 1, if the result >= 0 go to .loop, Y = a2, ...
	dec.b d0
	dec.b d0
	bpl .loop
	ldy.b a2
	lda.b d1
	sta.w tmap,y
	rtl

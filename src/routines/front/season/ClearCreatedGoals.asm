ClearCreatedGoals:					; ClearPlayerGoals for each created player slot in use (its first 3 bits
									; not 0), players $26A on
	lda.w #$026A
	sta.b tmp3
	ldy.w #$0000
.loop:								; loop: call NextSaveBits3, if A = $0000 go to .1, push Y, A = tmp3, ...
	jsr.w NextSaveBits3
	cmp.w #$0000
	beq .1
	phy
	lda.b tmp3
	jsr.w ClearPlayerGoals
	ply
.1:									; tmp3 + 1, A = Y, A + $0099, Y = A, ...
	inc.b tmp3
	clc
	tya
	adc.w #$0099
	tay
	cpy.w #$0C30
	bcc .loop
	rtl
	rtl								; unreached: no code branches, falls or points here

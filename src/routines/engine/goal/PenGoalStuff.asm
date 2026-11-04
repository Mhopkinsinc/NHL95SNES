PenGoalStuff:						; called from other segments
	pei ($7F)
	pei ($81)
	pei ($83)
	pei ($85)
	pei ($87)
	pei ($89)
	pei ($63)
	pei ($65)
	jsl.l CloseLCBoxes
	lda.w gsp
	cmp.w #$0003
	beq .4
	lda.w #PenBuf
	sta.b a0
.loop:								; loop: A = (a0), a0 + 1, a0 + 1, A and $00FF, ...
	lda.b (a0)
	inc.b a0
	inc.b a0
	and.w #$00FF
	cmp.w #$0034
	beq .loop
	cmp.w #$0000
	bne .1
	jmp.w .5
.1:									; Y = A, a1+2 = Penaltylist>>16, a1 = Penaltylist&$FFFF, A = [a1],y, ...
	tay
	lda.w #Penaltylist>>16
	sta.b a1+2
	lda.w #Penaltylist&$FFFF
	sta.b a1
	lda.b [a1],y
	clc
	adc.b a1
	sta.b a1
	lda.b [a1]
	and.w #$00FF
	beq .3
	dec.b a0
	dec.b a0
	lda.w #$0000
	sta.b d0
	lda.b (a0)
	inc.b a0
	inc.b a0
	and.w #$FF00
	cmp.w #$0600
	bcc .2
	lda.w #$0002
	sta.b d0
.2:									; if a2 = d0 go to .loop
	lda.b a2
	cmp.b d0
	beq .loop
.3:									; a0 - 1, a0 - 1, (a0) = $0034, a0 + 1, ...
	dec.b a0
	dec.b a0
	lda.w #$0034
	sta.b (a0)
	inc.b a0
	inc.b a0
	bra .loop
.4:									; call ClearPenaltyBuffer
	jsl.l ClearPenaltyBuffer
.5:									; Y = a2, A = tmap,y, Y = a1, A - tmap,y, ...
	ldy.b a2
	lda.w tmap,y
	ldy.b a1
	sec
	sbc.w tmap,y
	beq .8
	bmi .8
	lda.b a1
	beq .6
	lda.w #$001A
.6:									; a0 = A
	sta.b a0
.loop2:								; loop: Y = a0, A = tmboxlist,y, a0 + 1, A and $00FF, ...
	ldy.b a0
	lda.w tmboxlist,y
	inc.b a0
	and.w #$00FF
	sta.b d2
	bit.w #$0080
	bne .8
	lda.b a1
	beq .7
	lda.w #$0034
.7:									; A + d2, Y = A, A = tmpdst,y, if a $4000 bit set go to .loop2, ...
	clc
	adc.b d2
	tay
	lda.w tmpdst,y
	bit.w #$4000
	bne .loop2
	lda.w #$0000
	sta.w tmpdst,y
	jsl.l RemovePlayerFromList
	ldy.b a1
	lda.w tmap,y
	inc a
	sta.w tmap,y
	jsr.w RestorePenaltyPad
	ldy.b a2
	lda.w tmPwrGoals,y
	inc a
	sta.w tmPwrGoals,y
	lda.w #$0001
	tsb.w tmflags
	tsb.w tmflags+2
.8:									; pull A, a0+2 = A, pull A, a0 = A, ...
	pla
	sta.b a0+2
	pla
	sta.b a0
	pla
	sta.b d2+2
	pla
	sta.b d2
	pla
	sta.b d1+2
	pla
	sta.b d1
	pla
	sta.b d0+2
	pla
	sta.b d0
	rtl

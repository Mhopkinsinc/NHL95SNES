RosterColStatus:					; TeamRoster's status column for player d0: Ice, Bench, Inj= P / Inj= G
									; (RosterStatusTexts) or the penalty time left (M:SS)
	lda.b d0
	asl a
	ldx.b a2
	beq .1
	adc.w #$0034
.1:									; Y = A, if tmpdst,y >= 0 go to .2, A xor $FFFF, ...
	tay
	lda.w tmpdst,y
	bpl .2
	eor.w #$FFFF
	cmp.w #$0004
	bcc .5
	lda.w #$0001
	bra .5
.2:									; if $1000 bits clear go to .3, A = $0003, go to .5
	bit.w #$1000
	beq .3
	lda.w #$0003
	bra .5
.3:									; push A, A and $0FFF, call TimeTextMSS, pull A, ...
	pha
	and.w #$0FFF
	jsr.w TimeTextMSS
	pla
	bit.w #$4000
	beq .4
	lda.w #$2043
	sta.w mesarea,x
	stz.w mesarea+2,x
.4:									; X = mesarea, Y = a2+2, call PrintBoldCentredStr, return
	ldx.w #mesarea
	ldy.b a2+2
	jsl.l PrintBoldCentredStr
	rts
.5:									; A * 2, X = A, A = RosterStatusTexts,x, X = A, ...
	asl a
	tax
	lda.l RosterStatusTexts,x
	tax
	ldy.b a2+2
	jsl.l PrintBoldCentred
	rts

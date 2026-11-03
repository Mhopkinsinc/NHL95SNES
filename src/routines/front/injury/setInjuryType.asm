setInjuryType:						; called from other segments
	ldy.b a2
	lda.w pflags,y
	ora.w #$1000
	sta.w pflags,y
	lda.l Crowdlevel
	clc
	adc.w #$012C
	sta.l Crowdlevel
	lda.w #$003C
	sta.b crowdhold
	lda.w #$000A
	jsl.l StartSound
	ldy.b a2
	lda.w Xpos,y
	sta.w xc1
	lda.w Ypos,y
	sta.w yc1
	lda.w #$0040
	tsb.w sflags
	stz.b d1
	stz.b a0
	lda.w pfteam,y
	beq .1
	lda.w #$8000
	sta.b d1
	lda.w #$0002
	sta.b a0
.1:									; A = pnum,y, A and $00FF, A or d1, TempPlOffset = A, ...
	lda.w pnum,y
	and.w #$00FF
	ora.b d1
	sta.w TempPlOffset
	and.w #$00FF
	bit.w #$0080
	beq .2
	ora.w #$FF00
.2:									; A * 2, d1 = A, if a0 = 0 go to .3, A = $0034
	asl a
	sta.b d1
	lda.b a0
	beq .3
	lda.w #$0034
.3:									; A + d1, Y = A, tmpdst,y = $FFFD, A = $0007, ...
	adc.b d1
	tay
	lda.w #$FFFD
	sta.w tmpdst,y
	lda.w #$0007
	jsl.l randoma8
	cmp.w #$0000
	bne .rtl
	lda.w #$FFFC
	sta.w tmpdst,y
	lda.w TempPlOffset
	ora.w #$4000
	sta.w TempPlOffset
.rtl:								; return
	rtl

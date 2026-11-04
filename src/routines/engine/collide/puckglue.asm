puckglue:							; give player a2 puck possession and update possession statistics and
									; control
	ldy.b a2
	cpy.w puckc
	beq .1
	jsl.l EndPenaltyShot
	stz.w breakaway
	stz.w onetimer
.1:									; puckc = a2, puckvz = 0, puckz = 0, ...
	ldy.b a2
	sty.w puckc
	stz.w puckvz
	stz.w puckz
	lda.w SPA,y
	cmp.w #SPAHold&$FFFF
	bcc .2
	cmp.w #$22B3
	bcs .2
	lda.w #$FFFF
	sta.w puckc
.2:									; d0 = Y, a0 = 0, a1 = $0002, if pfteam,y is not 0 go to .3, ...
	sty.b d0
	stz.b a0
	lda.w #$0002
	sta.b a1
	lda.w pfteam,y
	bne .3
	stz.b a1
	lda.w #$0002
	sta.b a0
.3:									; Y = a0, tmtouch2,y = $FFFF, tmtouch3,y = A, A = tmflags,y, ...
	ldy.b a0
	lda.w #$FFFF
	sta.w tmtouch2,y
	sta.w tmtouch3,y
	lda.w tmflags,y
	ora.w #$0004
	sta.w tmflags,y
	lda.w #$0010
	trb.w sflags3
	beq .4
	ldy.b a1
	lda.w tmfowon,y
	inc a
	sta.w tmfowon,y
	lda.l Crowdlevel
	clc
	adc.w #$00C8
	sta.l Crowdlevel
	lda.w #$0014
	sta.b crowdhold
.4:									; if gmclock is not 0 go to .5, ...
	lda.w gmclock
	bne .5
	lda.b a2
	cmp.w passReceiverPlayerNum
	bne .5
	ldy.b a1
	lda.w tmpasscomp,y
	inc a
	sta.w tmpasscomp,y
.5:									; A = $000C, Y = a2, if position,y is not 0 go to .6, ...
	lda.w #$000C
	trb.w sflags
	ldy.b a2
	lda.w position,y
	bne .6
	jsl.l ChkShotStat
	ldy.b a2
	lda.w #$008C
	sta.w temp5,y
	lda.w SPA,y
	cmp.w #SPAgdive&$FFFF
	bne .6
	lda.w #$0005
	sta.w temp5,y
.6:									; if a2 is not passReceiverPlayerNum go to .7, Y = a1, d4 = passpad,y, ...
	lda.b a2
	cmp.w passReceiverPlayerNum
	bne .7
	ldy.b a1
	lda.w passpad,y
	sta.b d4
	bmi .7
	jsl.l AssignPadIfFree
	bra .8
.7:									; call PuckCarrierPad
	jsl.l PuckCarrierPad
.8:									; passReceiverPlayerNum = $FFFF, return
	lda.w #$FFFF
	sta.w passReceiverPlayerNum
	rtl

a2touchpuck:						; called from other segments
	ldy.b a2
	cpy.w #$0018
	bcc .1
	jmp.w .rtl
.1:									; ltx = Xpos,y, lty = Ypos,y, A = Y, A / 2, ...
	lda.w Xpos,y
	sta.w ltx
	lda.w Ypos,y
	sta.w lty
	tya
	lsr a
	sta.w ltplayer
	stz.b a0
	lda.w pfteam,y
	beq .2
	inc.b a0
	inc.b a0
.2:									; d0 = pnum,y, Y = a0, if pnum,y = tmtouch1,y go to .6, A = tmflags,y, ...
	lda.w pnum,y
	sta.b d0
	ldy.b a0
	cmp.w tmtouch1,y
	beq .6
	lda.w tmflags,y
	bit.w #$0004
	beq .4
	and.w #$FFFB
	sta.w tmflags,y
	cpy.w #$0000
	bne .5
	lda.w CwdExciteLvl
	clc
	adc.w #$000A
	bmi .3
	sta.w CwdExciteLvl
.3:									; go to .5
	bra .5
.4:									; tmtouch3,y = tmtouch2,y, tmtouch2,y = tmtouch1,y
	lda.w tmtouch2,y
	sta.w tmtouch3,y
	lda.w tmtouch1,y
	sta.w tmtouch2,y
.5:									; tmtouch1,y = d0, if d0 is not tmtouch3,y go to .6, tmtouch3,y = $FFFF
	lda.b d0
	sta.w tmtouch1,y
	cmp.w tmtouch3,y
	bne .6
	lda.w #$FFFF
	sta.w tmtouch3,y
.6:									; A = $1000, call a2offsides, Y = a2, A = iflags, ...
	lda.w #$1000
	trb.w sflags
	jsl.l a2offsides
	ldy.b a2
	lda.w iflags
	bit.w #$0004
	beq .9
	bit.w #$0001
	beq .9
	lda.w position,y
	beq .9
	lda.w iflags
	bit.w #$0002
	bne .8
	lda.w pfgoal,y
	beq .9
.7:									; push X, A = iflags+1, A and $00FF, A * 2, ...
	phx
	lda.w iflags+1
	and.w #$00FF
	asl a
	sta.b a3
	tax
	lda.w #$000C
	sta.b d0
	jsl.l AddPenalty
	plx
	stx.b a3
.rtl:								; return
	rtl
.8:									; if pfgoal,y = 0 go to .7
	lda.w pfgoal,y
	beq .7
.9:									; A = Y, A / 2, iflags = A, d0 = pucky, ...
	tya
	lsr a
	xba
	sta.w iflags
	lda.w pucky
	sta.b d0
	lda.w pfgoal,y
	beq .10
	lda.w #$0002
	tsb.w iflags
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
.10:								; if d0 < 0 go to .rtl, A = tmap, A - tmap+2, d0 = A, ...
	lda.b d0
	bmi .rtl
	lda.w tmap
	sec
	sbc.w tmap+2
	sta.b d0
	lda.w pfteam,y
	beq .11
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
.11:								; if d0 < 0 go to .rtl, A = $0004, return
	lda.b d0
	bmi .rtl
	lda.w #$0004
	tsb.w iflags
	rtl

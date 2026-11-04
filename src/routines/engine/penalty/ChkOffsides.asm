ChkOffsides:						; the offsides check: ClearOffsidesIfAllPlayers for both sides, then the
									; puck against the blue line (ChkOffsides_other / _blue / _rtl)
	stz.b a1
	lda.w #$0002
	sta.b a2
	jsl.l ClearOffsidesIfAllPlayers
	stz.b a2
	lda.w #$0002
	sta.b a1
	jsl.l ClearOffsidesIfAllPlayers
	lda.w #$0058
	sta.b d0
	lda.w pucky
	bpl .1
	jmp.w ChkOffsides_other
.1:									; A = d0, A - pucky, if the result < 0 go to .2, A = d0, ...
	lda.b d0
	sec
	sbc.w pucky
	bmi .2
	lda.b d0
	sec
	sbc.w OldYpos+$1C
	bpl OffsidesReturn
	bra ChkOffsides_blue
.2:									; A = d0, A - OldYpos+$1C, if the result < 0 go to OffsidesReturn
	lda.b d0
	sec
	sbc.w OldYpos+$1C
	bmi OffsidesReturn
ChkOffsides_blue:					; from ChkOffsides
	jsl.l StartBreakaway
	lda.w gmode
	bit.w #$0020
	bne .1
	jmp.w OffsidesReturn
.1:									; d0 = $0062, A = gmode, if $0002 bits clear go to .2, A = a2, ...
	lda.w #$0062
	sta.b d0
	lda.w gmode
	bit.w #$0002
	beq .2
	lda.b a2
	ldy.b a1
	sty.b a2
	sta.b a1
.2:									; if puckc >= 0 go to .3, A = lastplayer, A * 2
	lda.w puckc
	bpl .3
	lda.w lastplayer
	asl a
.3:									; if A - $000C >= 0 go to .4, if a2 = 0 go to .5, go to OffsidesReturn
	cmp.w #$000C
	bpl .4
	lda.b a2
	beq .5
	bra OffsidesReturn
.4:									; if a2 = 0 go to OffsidesReturn
	lda.b a2
	beq OffsidesReturn
.5:									; d2 = $0005, Y = a2, a0 = tmsort,y
	lda.w #$0005
	sta.b d2
	ldy.b a2
	lda.w tmsort,y
	sta.b a0
ChkOffsides_loop:					; from OffsidesNextPlayer
	ldy.b a0
	lda.w position,y
	bmi OffsidesNextPlayer
	lda.b d0
	sec
	sbc.w Ypos,y
	bpl OffsidesNextPlayer
	ldy.b a2
	lda.w tmflags,y
	ora.w #$0010
	sta.w tmflags,y
OffsidesReturn:						; the return of the offside checks
	rtl

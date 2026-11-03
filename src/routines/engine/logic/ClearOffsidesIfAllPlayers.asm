ClearOffsidesIfAllPlayers:			; called from other segments
	ldy.b a2
	lda.w tmflags,y
	bit.w #$0010
	bne .1
	jmp.w OffsidesReturn
.1:									; a0 = tmsort,y, d1 = $0005
	lda.w tmsort,y
	sta.b a0
	lda.w #$0005
	sta.b d1
.2:									; Y = a0, if position,y < 0 go to .3, d0 = Ypos,y, ...
	ldy.b a0
	lda.w position,y
	bmi .3
	lda.w Ypos,y
	sta.b d0
	lda.w pfgoal,y
	bne .3
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
.3:									; a0 + 1, a0 + 1, A = d0, A - $005C, ...
	inc.b a0
	inc.b a0
	lda.b d0
	sec
	sbc.w #$005C
	bmi .4
	jmp.w OffsidesReturn
.4:									; d1 - 1, if the result >= 0 go to .2, Y = a2, A = tmflags,y, ...
	dec.b d1
	bpl .2
	ldy.b a2
	lda.w tmflags,y
	and.w #$FFEF
	sta.w tmflags,y
	rtl

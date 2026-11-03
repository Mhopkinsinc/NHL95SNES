avdgoal:							; adjust the skating target so the path avoids a goal
	stz.b tmp2
	lda.w Xpos,x
	sta.b p0
	lda.w Ypos,x
	sta.b p0+2
	lda.b d0
	sta.b p1
	lda.b d1
	sta.b p1+2
	lda.w position,x
	bne .1
	jmp.w AvoidGoalForGoalie
.1:									; X = $00EB, Y = $0122, call ClassifySkaterGoalPath, X = $00EA, ...
	ldx.w #$00EB
	ldy.w #$0122
	jsr.w ClassifySkaterGoalPath
	ldx.w #$00EA
	ldy.w #$0123
	stx.b r3
	sty.b $42
	lda.w #$010E
	sta.b $46
	lda.w topgoalie
	sta.b $44
	lda.b tmp2
	bne .2
	ldx.w #$FEDE
	ldy.w #$FF15
	jsr.w ClassifySkaterGoalPath
	ldx.w #$FEDD
	ldy.w #$FF16
	stx.b r3
	sty.b $42
	lda.w #$FEF2
	sta.b $46
	lda.w botgoalie
	sta.b $44
	lda.b tmp2
	bne .4
	ldx.b curobj
	rtl
.2:									; A = r3, r3 = $42, $42 = A, A = p0+2, ...
	lda.b r3
	ldy.b $42
	sty.b r3
	sta.b $42
	lda.b p0+2
	eor.w #$FFFF
	inc a
	sta.b p0+2
	lda.b p1+2
	eor.w #$FFFF
	inc a
	sta.b p1+2
	lda.b tmp0
	bit.w #$000A
	beq .3
	eor.w #$000A
	sta.b tmp0
.3:									; A = tmp1, if $000A bits clear go to .4, A xor $000A, tmp1 = A
	lda.b tmp1
	bit.w #$000A
	beq .4
	eor.w #$000A
	sta.b tmp1
.4:									; if tmp1 = 0 go to .5, X = tmp0, call (AvoidGoalHandlers,x), ...
	lda.b tmp1
	beq .5
	ldx.b tmp0
	jsr (AvoidGoalHandlers,x)
	ldx.b curobj
	rtl
.5:									; call AvoidGoalInsideTarget, X = curobj, return
	jsr.w AvoidGoalInsideTarget
	ldx.b curobj
	rtl

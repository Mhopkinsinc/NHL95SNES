PadTakeLeftDefense:					; with defense control on for the pad's team: pad d4 takes the left
									; defenseman (by the side the team shoots at), then PadTakePosition
	ldy.w #$0000
	cpx.w #$000C
	bcc .1
	ldy.w #$0002
.1:									; if defcontrol,y is not 0 go to .2, return
	lda.w defcontrol,y
	bne .2
	rtl
.2:									; A = $0001, if pfgoal,x is not 0 go to PadTakePosition, A = $0002
	lda.w #$0001
	ldy.w pfgoal,x
	bne PadTakePosition
	lda.w #$0002
PadTakePosition:					; from PadTakeGoalie, PassPadToTeammate, PadTakeRightDefense, ...
	sta.b d1
	phx
	ldy.b d4
	ldx.w #$0000
	lda.w cont1team,y
	cmp.w #$0001
	beq .1
	ldx.w #$000C
.1:									; d0 = $0005
	lda.w #$0005
	sta.b d0
.loop:								; loop: if position,x = d1 go to .2, X + 1, X + 1, d0 - 1, ...
	lda.w position,x
	cmp.b d1
	beq .2
	inx
	inx
	dec.b d0
	bpl .loop
	bra .3
.2:									; if playerpad,x >= 0 go to .3, A = pflags,x, ...
	lda.w playerpad,x
	bpl .3
	lda.w pflags,x
	bit.w #$1000
	bne .3
	lda.w padinputdone,y
	inc a
	sta.w padinputdone,y
	stx.b d0
	jsl.l AssignPadPlayer
.3:									; pull X, return
	plx
	rtl

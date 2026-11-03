PadTakeRightDefense:				; with defense control on for the pad's team: pad d4 takes the right
									; defenseman (by the side the team shoots at), then PadTakePosition
	ldy.w #$0000
	cpx.w #$000C
	bcc .1
	ldy.w #$0002
.1:									; if defcontrol,y is not 0 go to .2, return
	lda.w defcontrol,y
	bne .2
	rtl
.2:									; A = $0002, if pfgoal,x is not 0 go to PadTakePosition, A = $0001, ...
	lda.w #$0002
	ldy.w pfgoal,x
	bne PadTakePosition
	lda.w #$0001
	bra PadTakePosition

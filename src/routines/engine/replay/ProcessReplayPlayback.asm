ProcessReplayPlayback:				; handle replay stepping, play toggle and exit
	lda.w replaylock
	cmp.w #$FFFF
	bne .6
	lda.w PadControlObj
	cmp.w #$000F
	beq .1
	asl a
	tax
	lda.w #$000F
	sta.w PadControlObj+12
	lda.w Xpos,x
	sta.w Xpos+32
	lda.w Ypos,x
	sta.w Ypos+32
	bra .6
.1:									; PadControlObj+12 = $000F, if puckx - $FF65 >= 0 go to .2, A = $FF65
	lda.w #$000F
	sta.w PadControlObj+12
	lda.w puckx
	cmp.w #$FF65
	bpl .2
	lda.w #$FF65
.2:									; if A - $009B < 0 go to .3, A = $009B
	cmp.w #$009B
	bmi .3
	lda.w #$009B
.3:									; Xpos+32 = A, if pucky - $FED4 >= 0 go to .4, A = $FED4
	sta.w Xpos+32
	lda.w pucky
	cmp.w #$FED4
	bpl .4
	lda.w #$FED4
.4:									; if A - $012C < 0 go to .5, A = $012C
	cmp.w #$012C
	bmi .5
	lda.w #$012C
.5:									; Ypos+32 = A
	sta.w Ypos+32
.6:									; A = d1, if $8000 bits clear go to .8, if $7E24DA = 0 go to .7, ...
	lda.b d1
	bit.w #$8000
	beq .8
	lda.l $7E24DA
	beq .7
	jsl.l ClearTextMap
	jsl.l WaitTransfers
	lda.w #$0000
	sta.l $7E24DA
.7:									; A = sflags3, A xor $0002, sflags3 = A
	lda.w sflags3
	eor.w #$0002
	sta.w sflags3
.8:									; A = d3, if a $0020 bit set go to .9, if a $0050 bit set go to .13, ...
	lda.b d3
	bit.w #$0020
	bne .9
	bit.w #$0050
	bne .13
	lda.b d1
	bit.w #$2000
	bne .11
	bit.w #$1000
	bne .10
	lda.b d3
	bit.w #$0080
	bne .12
	bit.w #$4000
	beq .16
	jsl.l suba4
	jsl.l suba4
	bra .15
.9:									; call suba4, X = $0003, go to .14
	jsl.l suba4
	ldx.w #$0003
	bra .14
.10:								; go to .18
	jmp.w .18
.11:								; replaylock = $FFFF, A = $0020, go to ReadReplayCameraInput
	lda.w #$FFFF
	sta.w replaylock
	lda.w #$0020
	trb.w sflags
	jmp.w ReadReplayCameraInput
.12:								; call adda4, call adda4, go to .15
	jsl.l adda4
	jsl.l adda4
	bra .15
.13:								; call adda4, X = $0003, A = d3, if a $0010 bit set go to .14, ...
	jsl.l adda4
	ldx.w #$0003
	lda.b d3
	bit.w #$0010
	bne .14
	ldx.w #$0006
.14:								; Y = $0000, call WaitFrames_Inc
	ldy.w #$0000
	jsl.l WaitFrames_Inc
.15:								; d7 = $0001, A = $0002, go to UpdateReplayCamera
	lda.w #$0001
	sta.b d7
	lda.w #$0002
	trb.w sflags3
	jmp.w UpdateReplayCamera
.16:								; A = sflags3, if a $0002 bit set go to .17, go to ReadReplayCameraInput
	lda.w sflags3
	bit.w #$0002
	bne .17
	jmp.w ReadReplayCameraInput
.17:								; call adda4, if d7 = 0 go to .15, go to UpdateReplayCamera
	jsl.l adda4
	lda.b d7
	beq .15
	jmp.w UpdateReplayCamera
.18:								; PadControlObj+12 = $000F, pull A, Hpos = A, pull A, ...
	lda.w #$000F
	sta.w PadControlObj+12
	pla
	sta.b Hpos
	pla
	sta.b Vpos
	pla
	sta.w recbpr+2
	pla
	sta.w recbpr
	lda.w #$0020
	trb.w sflags
	lda.w recbpr+2
	sta.b $75
	lda.w recbpr
	sta.b a4
	jsl.l RestoreReplayFrame
	lda.w #$0800
	trb.w sflags
	jsl.l SetHor
	stz.w textdirtylo
	lda.w #$03FF
	sta.w textdirtyhi
	jsl.l FadeOut
	jsl.l forceblack
	lda.w shootoutmode
	bne .19
	lda.w replaymusic
	beq .19
	lda.w OptPlayMode
	beq .19
	cmp.w #$0004
	beq .19
	lda.w playoffRoundIdx
	cmp.w #$0002
	bcc .19
	jmp.w .19
.19:								; gameframes = SavedGameframes, return
	lda.w SavedGameframes
	sta.b gameframes
	rtl

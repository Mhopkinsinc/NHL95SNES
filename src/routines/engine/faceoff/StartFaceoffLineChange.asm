StartFaceoffLineChange:				; player d0 opens its team's line change box; when the box is open its
									; timer starts in temp1 (home, $258) or temp2 (away, $168) of the puck,
									; the player's object number in temp3 / temp4
	ldy.b a3
	sty.b a2
	lda.b d0
	asl a
	sta.b d0
	sta.b a3
	tax
	phy
	ldy.w #$0000
	lda.w pfteam,x
	beq .1
	ldy.w #$0002
.1:									; lcpad,y = $FFFF, call SetLCmode, pull Y, a2 = Y, ...
	lda.w #$FFFF
	sta.w lcpad,y
	jsl.l SetLCmode
	ply
	sty.b a2
	ldx.b a3
	phy
	ldy.w #$0000
	lda.w pfteam,x
	beq .2
	ldy.w #$0002
.2:									; A = tmflags,y, pull Y, if $0008 bits clear go to .4, ...
	lda.w tmflags,y
	ply
	bit.w #$0008
	beq .4
	lda.w pfteam,x
	beq .3
	lda.w #$0168
	sta.w temp2,y
	txa
	lsr a
	sta.w temp4,y
	bra .4
.3:									; temp1,y = $0258, A = X, A / 2, temp3,y = A
	lda.w #$0258
	sta.w temp1,y
	txa
	lsr a
	sta.w temp3,y
.4:									; X = a2, a2 = a3, a3 = X
	ldx.b a2
	ldy.b a3
	sty.b a2
	stx.b a3
rtsfaceoff:							; the shared return of the face off routines
	rtl

LoadTeamLines:						; copies team a2's lines into RAM through GetTeamLines; OptLine tested as
									; in 94S
	pei ($6F)
	pei ($67)
	phx
	phy
	jsl.l GetTeamLines
	pei ($6F)
	lda.w #HomeRoster
	ldx.b a2
	beq .1
	lda.w #VisRoster
.1:									; a1 = A, A + $0008, X = A, Y = $001C
	sta.b a1
	clc
	adc.w #$0008
	tax
	ldy.w #$001C
.loop:								; loop: (a3) = $006C,x, X + 1, X + 1, a3 + 1, ...
	lda.w $006C,x
	sta.b (a3)
	inx
	inx
	inc.b a3
	inc.b a3
	dey
	bne .loop
	ply
	lda.w OptLine
	bne .2
	stz.w LCBoxesClosed
	ldx.b a1
	lda.w $006C,x
	sta.w $0000,y
	lda.w $006E,x
	sta.w $0002,y
	lda.w $0070,x
	sta.w $0004,y
	lda.w $0072,x
	sta.w $0006,y
.2:									; pull Y, pull X, pull A, a1 = A, ...
	ply
	plx
	pla
	sta.b a1
	pla
	sta.b a3
	rtl

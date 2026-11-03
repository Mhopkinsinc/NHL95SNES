FaceoffPads:						; restores pad sides and resets player control before assigning each team
									; pad through findpc
	jsl.l CalcPuckDistances
	lda.w OptPlayMode
	cmp.w #$0001
	beq .2
	lda.w penshot
	bne .2
	ldy.w #$0008
.loop:								; loop: A = padside,y, A and $FF00, if A is not $8000 go to .1, ...
	lda.w padside,y
	and.w #$FF00
	cmp.w #$8000
	bne .1
	lda.w padside,y
	and.w #$00FF
	sta.w padside,y
	inc a
	inc a
	lsr a
	sta.w cont1team,y
.1:									; Y - 1, Y - 1, if the result >= 0 go to .loop
	dey
	dey
	bpl .loop
.2:									; benchcheer = 0, X = $0016, A = $FFFF
	stz.w benchcheer
	ldx.w #$0016
	lda.w #$FFFF
.loop2:								; loop: playerpad,x = A, goalieflags,x = 0, goalieturnwait,x = 0, ...
	sta.w playerpad,x
	stz.w goalieflags,x
	stz.w goalieturnwait,x
	stz.w goaliedivewait,x
	stz.w FaceoffUnused,x
	dex
	dex
	bpl .loop2
	sta.w dumpinplayer
	ldx.w #$0008
.loop3:								; loop: c1playernum,x = A, X - 1, X - 1, ...
	sta.w c1playernum,x
	dex
	dex
	bpl .loop3
	lda.w teampads
	beq .6
	lda.w #$0005
	sta.b p0
	ldx.w fopadfirst
	lda.w #$FFFF
	sta.w fopadfirst
	dex
	dex
	bpl .loop4
	ldx.w #$0008
.loop4:								; loop: if padside,x is not 0 go to .4, d4 = X, push X, ...
	lda.w padside,x
	bne .4
	stx.b d4
	phx
	lda.w fopadfirst
	bpl .3
	stx.w fopadfirst
.3:									; call findpc, pull X
	jsl.l findpc
	plx
.4:									; X - 1, X - 1, if the result >= 0 go to .5, X = $0008
	dex
	dex
	bpl .5
	ldx.w #$0008
.5:									; p0 - 1, if the result is not 0 go to .loop4
	dec.b p0
	bne .loop4
.6:									; if teampads+2 = 0 go to .rtl, p0 = $0005, X = fopadfirst+2, ...
	lda.w teampads+2
	beq .rtl
	lda.w #$0005
	sta.b p0
	ldx.w fopadfirst+2
	lda.w #$FFFF
	sta.w fopadfirst+2
	dex
	dex
	bpl .loop5
	ldx.w #$0008
.loop5:								; loop: if padside,x is not $0002 go to .8, d4 = X, push X, ...
	lda.w padside,x
	cmp.w #$0002
	bne .8
	stx.b d4
	phx
	lda.w fopadfirst+2
	bpl .7
	stx.w fopadfirst+2
.7:									; call findpc, pull X
	jsl.l findpc
	plx
.8:									; X - 1, X - 1, if the result >= 0 go to .9, X = $0008
	dex
	dex
	bpl .9
	ldx.w #$0008
.9:									; p0 - 1, if the result is not 0 go to .loop5
	dec.b p0
	bne .loop5
.rtl:								; return
	rtl

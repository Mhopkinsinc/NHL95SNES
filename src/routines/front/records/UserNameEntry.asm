UserNameEntry:						; with user records on (not in practice): NameEntryScreen for the first
									; pad on the home team, then for the first on the away team, keeping each
									; one's name
	lda.w #$FFFF
	sta.w HomeUserRec
	sta.w VisUserRec
	lda.w OptPlayMode
	cmp.w #$0001
	beq .rts
	lda.w OptUserRec
	beq .rts
	jsr.w StartUserNameEntry
	ldy.w #$0000
.loop:								; loop: if cont1team,y = $0001 go to .2, Y + 1, Y + 1, ...
	lda.w cont1team,y
	cmp.w #$0001
	beq .2
	iny
	iny
	cpy.w #$000A
	bne .loop
.1:									; Y = $0000
	ldy.w #$0000
.loop2:								; loop: if cont1team,y = $0002 go to .3, Y + 1, Y + 1, ...
	lda.w cont1team,y
	cmp.w #$0002
	beq .3
	iny
	iny
	cpy.w #$000A
	bne .loop2
.rts:								; return
	rts
.2:									; a2 = HomeTeam, sfpj = Y, call NameEntryScreen, ...
	lda.w HomeTeam
	sta.b a2
	sty.w sfpj
	jsr.w NameEntryScreen
	lda.b a0+2
	sta.w HomeUserRec
	bra .1
.3:									; a2 = VisTeam, sfpj = Y, call NameEntryScreen, VisUserRec = a0+2, ...
	lda.w VisTeam
	sta.b a2
	sty.w sfpj
	jsr.w NameEntryScreen
	lda.b a0+2
	sta.w VisUserRec
	rts

ResetTeamPlayers:					; resets team a2: its flag $0010 cleared, then for its 6 players the
									; animation (ready for position 0, glide for others), impact, puck block
									; and collision flags
	ldy.b a2
	lda.w tmflags,y
	and.w #$FFEF
	sta.w tmflags,y
	lda.w #$0005
	sta.b d2
	ldx.w tmsort,y
	stx.b a3
.1:									; if handed,x = 0 go to .2, A = attribute,x, A and $F7FF, attribute,x = A
	lda.w handed,x
	beq .2
	lda.w attribute,x
	and.w #$F7FF
	sta.w attribute,x
.2:									; pf2aip,x = 0, A = pflags,x, A and $2FFF, pflags,x = A, ...
	stz.w pf2aip,x
	lda.w pflags,x
	and.w #$2FFF
	sta.w pflags,x
	lda.w position,x
	bmi .5
	bne .3
	lda.w #SPAgready&$FFFF
	bra .4
.3:									; A = SPAglide&$FFFF
	lda.w #SPAglide&$FFFF
.4:									; call SetSPAFromA, impact,x = 0, nopuck,x = 0, A = pflags,x, ...
	jsl.l SetSPAFromA
	stz.w impact,x
	stz.w nopuck,x
	lda.w pflags,x
	and.w #$FFF6
	sta.w pflags,x
	stz.w pfnc,x
	stz.w pfrev,x
	stz.w pfalock,x
.5:									; a3 + 1, a3 + 1, X = a3, d2 - 1, ...
	inc.b a3
	inc.b a3
	ldx.b a3
	dec.b d2
	bpl .1
	rtl

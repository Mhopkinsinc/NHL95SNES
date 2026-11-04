assepen:							; assignment (asstab entry 11): leave the penalty box
	lda.w attribute,x
	and.w #$F7FF
	sta.w attribute,x
	lda.w pflags,x
	bit.w #$0002
	bne .1
	jmp.w .3
.1:									; A and $FFFD, pflags,x = A, Y = $0010, if pfteam,x = 0 go to .2, ...
	and.w #$FFFD
	sta.w pflags,x
	ldy.w #$0010
	lda.w pfteam,x
	beq .2
	ldy.w #$0001
.2:									; d0 = Y, A = PBnum, A - d0, PBnum = A, ...
	sty.b d0
	lda.w PBnum
	sec
	sbc.b d0
	sta.w PBnum
	stz.w Xvel,x
	stz.w Yvel,x
	lda.w #$009B
	sta.w Xpos,x
	lda.w #$0002
	sta.w facedir,x
	sta.w pfalock,x
	lda.w #SPAwallout&$FFFF
	jsl.l SetSPAFromA
	jml.l SprSort
.3:									; facedir,x = $0004, newpnum,x = $FFFF, newpos,x = A, A = pflags,x, ...
	lda.w #$0004
	sta.w facedir,x
	lda.w #$FFFF
	sta.w newpnum,x
	sta.w newpos,x
	lda.w pflags,x
	and.w #$6FF7
	sta.w pflags,x
	stz.w pfnc,x
	lda.w #$F000
	sta.w Xvel,x
	lda.w handed,x
	bne .4
	lda.w attribute,x
	ora.w #$0800
	sta.w attribute,x
.4:									; X = a2, if teampads,x < $0004 go to .6, Y = padsitnext,x
	ldx.b a2
	lda.w teampads,x
	cmp.w #$0004
	bcc .6
	ldy.w padsitnext,x
.loop:								; loop: Y + 1, Y + 1, if Y is not $000A go to .5, Y = $0000
	iny
	iny
	cpy.w #$000A
	bne .5
	ldy.w #$0000
.5:									; if padside,y >= 0 go to .loop, A and $00FF, ...
	lda.w padside,y
	bpl .loop
	and.w #$00FF
	cmp.b a2
	bne .loop
	sta.w padside,y
	inc a
	inc a
	lsr a
	sta.w cont1team,y
	ldx.b curobj
	tya
	sta.w playerpad,x
	txa
	sta.w c1playernum,y
.6:									; X = curobj, go to assexit
	ldx.b curobj
	jml.l assexit

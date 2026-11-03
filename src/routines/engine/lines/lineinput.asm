lineinput:							; called from other segments
	pei ($83)
	stz.b a2
	lda.w pfteam,x
	beq .1
	inc.b a2
	inc.b a2
.1:									; Y = a2, A = tmflags,y, if $0001 bits clear go to .2, A and $FFFE, ...
	ldy.b a2
	lda.w tmflags,y
	bit.w #$0001
	beq .2
	and.w #$FFFE
	sta.w tmflags,y
	lda.w #$FFFF
	sta.w lcpad,y
	jsl.l SetLCmode2
.2:									; pull A, d1 = A, d2 = 0, if a $4000 bit set go to .4, ...
	pla
	sta.b d1
	stz.b d2
	bit.w #$4000
	bne .4
	inc.b d2
	bit.w #$8000
	bne .4
	inc.b d2
	bit.w #$0080
	bne .4
	bit.w #$2000
	bne .3
	lda.w pflags,x
	bit.w #$0008
	beq .rtl
	lda.w pfalock,x
	bne .rtl
	jml.l doplayeracc
.rtl:								; return
	rtl
.3:									; A = pflags,x, A or $0008, pflags,x = A, call loadTeamStruct, ...
	lda.w pflags,x
	ora.w #$0008
	sta.w pflags,x
	jsl.l loadTeamStruct
	ldy.b a2
	lda.w tmflags,y
	and.w #$FFF7
	sta.w tmflags,y
	lda.w #$FFFF
	sta.w lcpad,y
	jmp.w lcfound_close
.4:									; call lcfound, if minus go to .rtl2, if gmclock is not 0 go to .rtl2, ...
	jsl.l lcfound
	bmi .rtl2
	lda.w gmclock
	bne .rtl2
	jmp.w lcfound_close
.rtl2:								; return
	rtl

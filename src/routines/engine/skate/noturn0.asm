noturn0:							; from doplayeracc
	lda.w #$0002
	sta.b d4
	lda.w pfrev,x
	beq .1
	lda.w #$0006
	sta.b d4
	lda.b d0
	eor.w #$0008
	sta.b d0
.1:									; if d0 = 0 go to .5, d0 = Xvel,x, d1 = Yvel,x, call vtoa, ...
	lda.b d0
	beq .5
	lda.w Xvel,x
	sta.b d0
	lda.w Yvel,x
	sta.b d1
	jsl.l vtoa
	bit.w #$0008
	bne .2
	sec
	sbc.w facedir,x
	clc
	adc.b d4
	and.w #$0007
	sta.b d0
	cmp.w #$0004
	bcs .2
	jmp.w dostop
.2:									; facedir,x + 1, A = attribute,x, if $0800 bits clear go to .3, ...
	inc.w facedir,x
	lda.w attribute,x
	bit.w #$0800
	beq .3
	dec.w facedir,x
	dec.w facedir,x
.3:									; A = facedir,x, A and $0007, facedir,x = A, d1 = SPAglide&$FFFF, ...
	lda.w facedir,x
	and.w #$0007
	sta.w facedir,x
	lda.w #SPAglide&$FFFF
	sta.b d1
	lda.w pfrev,x
	bne .4
	jmp.w SetSPA
.4:									; Y = $0001, A = SPAglideback&$FFFF, go to SetSPAFromA
	ldy.w #$0001
	lda.w #SPAglideback&$FFFF
	jml.l SetSPAFromA
.5:									; Y = $0001, d1 = SPAskateback&$FFFF, if pfrev,x is not 0 go to .7, ...
	ldy.w #$0001
	lda.w #SPAskateback&$FFFF
	sta.b d1
	lda.w pfrev,x
	bne .7
	ldy.w #$0000
	lda.w #SPAskate&$FFFF
	sta.b d1
	lda.w pflags,x
	bit.w #$0004
	beq .6
	ldy.w #$0001
	lda.w #SPAstumble&$FFFF
	sta.b d1
.6:									; if X is not puckc go to .7, Y = $0000, d1 = SPAskatewp&$FFFF
	cpx.w puckc
	bne .7
	ldy.w #$0000
	lda.w #SPAskatewp&$FFFF
	sta.b d1
.7:									; if pf2aip,x is not 0 go to revplayeracc, A = Y, pf2aip,x = A, ...
	lda.w pf2aip,x
	bne revplayeracc
	tya
	sta.w pf2aip,x
	jsl.l SetSPA
revplayeracc:						; from doplayeracc, noturn0
	lda.w pfrev,x
	beq .1
	lda.b d2
	eor.w #$0004
	sta.b d2
.1:									; go to playeracc
	jmp.w playeracc

SetPlList:							; from setpersonel and other segments
	lda.w #$007E
	sta.b $75
	lda.w #PlList
	sta.b a4
	stz.w PlList
	stz.w PlList+2
	stz.w PlList+4
	lda.w #priolist>>16
	sta.b a0+2
	lda.w #priolist&$FFFF
	sta.b a0
	lda.w OptPlayMode
	cmp.w #$0001
	bne .1
	lda.w #(priolist+$E)>>16
	sta.b a0+2
	lda.w #(priolist+$E)&$FFFF
	sta.b a0
	bra .3
.1:									; if penshot = 0 go to .2, a0+2 = (priolist+$7)>>16, ...
	lda.w penshot
	beq .2
	lda.w #(priolist+$7)>>16
	sta.b a0+2
	lda.w #(priolist+$7)&$FFFF
	sta.b a0
	lda.b a2
	cmp.w BA_Team
	bne .3
	inc.b a0
	bra .3
.2:									; Y = a2, if tmgoalie,y >= 0 go to .3, a0 + 1
	ldy.b a2
	lda.w tmgoalie,y
	bpl .3
	inc.b a0
.3:									; call GetTeamLines, a1+2 = a3+2, a1 = a3, pull A, ...
	pei ($71)
	pei ($6F)
	jsl.l GetTeamLines
	lda.b a3+2
	sta.b a1+2
	lda.b a3
	sta.b a1
	pla
	sta.b a3
	pla
	sta.b a3+2
	ldy.b a2
	lda.w tmline,y
	asl a
	asl a
	asl a
	sta.b d0
	adc.b a1
	sta.b a1
	lda.w tmap,y
	sta.b d4
	bra .7
.loop:								; loop: Y = d4, A = [a0],y, A and $00FF, d5 = A, ...
	ldy.b d4
	lda.b [a0],y
	and.w #$00FF
	sta.b d5
	tay
	sep #$20
	lda.b [a1],y
	ldy.b d4
	sta.b [a4],y
	lda.b d5
	beq .4
	lda.w penshot
	beq .4
	lda.w BA_Skater_Offset
	inc a
	sta.b [a4],y
.4:									; Y + 1, Y + 1, Y + 1, Y + 1, ...
	iny
	iny
	iny
	iny
	iny
	iny
	lda.b d5
	sta.b [a4],y
	rep #$20
	lda.b d5
	bne .7
	ldy.b a2
	lda.w tmgoalie,y
	inc a
	sta.b d3
	bne .6
	lda.w OptPlayMode
	cmp.w #$0001
	beq .5
	lda.w penshot
	beq .6
.5:									; d3 + 1
	inc.b d3
.6:									; Y = d4, A 8-bit, [a4],y = d3, A 16-bit
	ldy.b d4
	sep #$20
	lda.b d3
	sta.b [a4],y
	rep #$20
.7:									; d4 - 1, if the result >= 0 go to .loop, d4 = $0005
	dec.b d4
	bpl .loop
	lda.w #$0005
	sta.b d4
.8:									; Y = d4, A = [a4],y, A and $00FF, d3 = A, ...
	ldy.b d4
	lda.b [a4],y
	and.w #$00FF
	sta.b d3
	bne .9
	jmp.w .13
.9:									; A and $00FF, if $0080 bits clear go to .10, A or $FF00
	and.w #$00FF
	bit.w #$0080
	beq .10
	ora.w #$FF00
.10:								; A - 1, A * 2, d3 = A, if a2 = 0 go to .11, ...
	dec a
	asl a
	sta.b d3
	lda.b a2
	beq .11
	lda.w #$0034
.11:								; A + d3, Y = A, if tmpdst,y = $FFFD go to .12, ...
	clc
	adc.b d3
	tay
	lda.w tmpdst,y
	cmp.w #$FFFD
	beq .12
	cmp.w #$FFFC
	beq .12
	lda.w tmpdst,y
	bmi .13
	beq .13
.12:								; call GetTeamLines, a1+2 = a3+2, a1 = a3, pull A, ...
	pei ($71)
	pei ($6F)
	jsl.l GetTeamLines
	lda.b a3+2
	sta.b a1+2
	lda.b a3
	sta.b a1
	pla
	sta.b a3
	pla
	sta.b a3+2
	lda.b d4
	clc
	adc.w #$0006
	tay
	lda.b [a4],y
	and.w #$00FF
	asl a
	sta.b d0
	lda.w #sublist>>16
	sta.b a0+2
	lda.w #sublist&$FFFF
	sta.b a0
	ldy.b d0
	lda.b [a0],y
	clc
	adc.b a0
	sta.b a0
.loop2:								; loop: A = [a0], a0 + 1, A and $00FF, d0 = A, ...
	lda.b [a0]
	inc.b a0
	and.w #$00FF
	sta.b d0
	bit.w #$0080
	bne .14
	ldy.b d0
	lda.b [a1],y
	and.w #$00FF
	sta.b d0
	jsl.l TryAddPlayerToList
	beq .loop2
.13:								; d4 - 1, if the result < 0 go to .rtl, go to .8
	dec.b d4
	bmi .rtl
	jmp.w .8
.rtl:								; return
	rtl
.14:								; call GetPlayerCount, d3 = d0
	jsl.l GetPlayerCount
	lda.b d0
	sta.b d3
.loop3:								; loop: d0 = d3, d3 - 1, if the result < 0 go to .13, ...
	lda.b d3
	sta.b d0
	dec.b d3
	bmi .13
	jsl.l TryAddPlayerToList
	beq .loop3
	bra .13

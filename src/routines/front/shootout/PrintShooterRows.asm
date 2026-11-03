PrintShooterRows:					; the shooter list's rows from picktop + 1, the row at curplayer
									; highlighted (printa $2000), each through GetNameandAttrib
	lda.w SelectedPlayerIdx
	dec a
	asl a
	asl a
	asl a
	sta.b d0
	ldy.b a2
	lda.w picktop
	inc a
	sta.b a3
	lda.w #MaxSpeed>>16
	sta.b $79
	lda.w #MaxSpeed
	sta.b $77
	lda.w #$0008
	sta.b d1
	lda.w SelectedPlayerIdx
	sec
	sbc.w #$0005
	beq .loop
	bmi .1
	bvc .2
	bra .loop
.1:									; if overflow clear go to .loop
	bvc .loop
.2:									; d1 - 1
	dec.b d1
.loop:								; loop: printa = $3800, if d1 is not curplayer go to .3, printa = $2000
	lda.w #$3800
	sta.w printa
	lda.b d1
	cmp.w curplayer
	bne .3
	lda.w #$2000
	sta.w printa
.3:									; printx = $0002, A = a3, A and $00FF, A - 1, ...
	lda.w #$0002
	sta.w printx
	lda.b a3
	and.w #$00FF
	dec a
	sta.b d0
	sta.b r1
	stz.b r2
	jsl.l GoalieCount
	lda.b r1
	cmp.b d0
	bpl .4
	lda.w #$0010
	sta.b r2
.4:									; d0 = r1, call GetNameandAttrib, a3 + 1, printy + 1, ...
	lda.b r1
	sta.b d0
	jsl.l GetNameandAttrib
	inc.b a3
	inc.w printy
	dec.b d1
	bpl .loop
	lda.w #$2000
	sta.w printa
	rtl

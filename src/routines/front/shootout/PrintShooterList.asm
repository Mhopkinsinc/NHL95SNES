PrintShooterList:					; the shooter list: area cleared, the rating page DispAttribCtr found in
									; ShooterAttribColumns (stepping back past the end), then PrintShooterRows
	lda.w #$0020
	sta.b d0
	lda.w #$000D
	sta.b d1
	lda.w blankchar
	sta.b d2
	jsl.l eraser
	lda.w #$0011
	sta.w printx
	lda.w #$0002
	sta.w printy
.1:									; a1+2 = ShooterAttribColumns>>16, a1 = ShooterAttribColumns, ...
	lda.w #ShooterAttribColumns>>16
	sta.b a1+2
	lda.w #ShooterAttribColumns
	sta.b a1
	lda.w DispAttribCtr
	sta.b d0
	bra .2
.loop:								; loop: A = a1, A + [a1], A + $0004, a1 = A
	lda.b a1
	clc
	adc.b [a1]
	adc.w #$0004
	sta.b a1
.2:									; if [a1] < 0 go to .3, d0 - 1, if the result >= 0 go to .loop
	lda.b [a1]
	bmi .3
	dec.b d0
	bpl .loop
.3:									; if [a1] >= 0 go to .4, DispAttribCtr - 1, go to .1
	lda.b [a1]
	bpl .4
	dec.w DispAttribCtr
	bra .1
.4:									; printa = $3800, d4+2 = [a1], Y = $0002, d4 = [a1],y, ...
	lda.w #$3800
	sta.w printa
	lda.b [a1]
	sta.b d4+2
	ldy.w #$0002
	lda.b [a1],y
	sta.b d4
	lda.w picktop
	cmp.w pickfirst
	beq .5
.5:									; A = picktop, A - pickfirst, A + $0009, if A - listcount >= 0 go to .6
	lda.w picktop
	sec
	sbc.w pickfirst
	clc
	adc.w #$0009
	cmp.w listcount
	bpl .6
.6:									; call PrintShooterRows, return
	jsl.l PrintShooterRows
	rtl

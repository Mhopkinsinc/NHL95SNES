MovePadIcon:						; moves pad icon X one place right ($0100 in A) or left ($0200) among x
									; $40, $80, $C0, keeping the pad counts d1 (right) / $85 (left) within d0
									; / $81
	tsb.b $7D
	bit.w #$0100
	beq .5
	lda.b $05,x
	cmp.w #$0080
	bcc .1
	lda.b d1
	cmp.b d0
	bcs .rts
	lda.b $05,x
	bra .2
.1:									; d1+2 - 1
	dec.b d1+2
.2:									; A + $0040, if A is not $00C0 go to .3, d1 + 1
	adc.w #$0040
	cmp.w #$00C0
	bne .3
	inc.b d1
.3:									; if A >= $00C1 go to .rts
	cmp.w #$00C1
	bcs .rts
.4:									; $05,x = A, return
	sta.b $05,x
	rts
.5:									; if $0200 bits clear go to .rts, if $05,x < $0081 go to .6, d1 - 1, ...
	bit.w #$0200
	beq .rts
	lda.b $05,x
	cmp.w #$0081
	bcc .6
	dec.b d1
	bra .7
.6:									; if d1+2 >= d0+2 go to .rts, A = $05,x
	lda.b d1+2
	cmp.b d0+2
	bcs .rts
	lda.b $05,x
	sec
.7:									; A - $0040, if A is not $0040 go to .8, d1+2 + 1
	sbc.w #$0040
	cmp.w #$0040
	bne .8
	inc.b d1+2
.8:									; if A >= $003F go to .4
	cmp.w #$003F
	bcs .4
.rts:								; return
	rts

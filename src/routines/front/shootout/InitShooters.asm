InitShooters:						; the 8 shooters of team a2 (0 home, 2 visitors) into its shooter list
	lda.w #$0000
	sta.b a3+2
	lda.w #homeshooters
	sta.b a3
	lda.w #$2E35
	sta.b a1
	lda.b a2
	beq .1
	lda.w #$0000
	sta.b a3+2
	lda.w #awayshooters
	sta.b a3
	lda.w #$3273
	sta.b a1
.1:									; Y = a2, a1+2 = $007E, d0 = $0007
	ldy.b a2
	lda.w #$007E
	sta.b a1+2
	lda.w #$0007
	sta.b d0
.loop:								; loop: A 8-bit, [a3] = [a1], A 16-bit, a1 + 1, ...
	sep #$20
	lda.b [a1]
	sta.b [a3]
	rep #$20
	inc.b a1
	inc.b a3
	dec.b d0
	bpl .loop
	rts

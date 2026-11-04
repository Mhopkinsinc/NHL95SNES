PutUserName:						; stores the name in mesarea as user A's name in SRUserNames: 12 letters
									; of 5 bits (a space $1B, $3E the end $1F, else - $40)
	asl a
	asl a
	sta.b tmp0
	asl a
	asl a
	asl a
	asl a
	sec
	sbc.b tmp0
	tay
	ldx.w #$0000
.1:									; A = mesarea,x, A and $00FF, if A is not $0020 go to .2, A = $001B, ...
	lda.w mesarea,x
	and.w #$00FF
	cmp.w #$0020
	bne .2
	lda.w #$001B
	bra .4
.2:									; if A = $003E go to .3, A - $0040, go to .4
	cmp.w #$003E
	beq .3
	sec
	sbc.w #$0040
	bra .4
.3:									; A = $001F
	lda.w #$001F
.4:									; call PutNameBits5, X + 1, if X is not $000C go to .1, return
	jsr.w PutNameBits5
	inx
	cpx.w #$000C
	bne .1
	rts

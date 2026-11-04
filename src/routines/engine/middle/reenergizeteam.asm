reenergizeteam:						; gives every player of team a2 full energy ($1000); the bench check after
									; it never passes (one value compared with $FFFD, then with $FFFC)
	ldy.w #$0032
	ldx.w #$0019
	lda.b a2
	beq .loop
	ldy.w #$0066
.loop:								; loop: tmpde,y = $1000, if tmpdst,y is not $FFFD go to .1, ...
	lda.w #$1000
	sta.w tmpde,y
	lda.w tmpdst,y
	cmp.w #$FFFD
	bne .1
	cmp.w #$FFFC
	bne .1
	lda.w #$FFFE
	sta.w tmpdst,y
.1:									; Y - 1, Y - 1, X - 1, if the result >= 0 go to .loop, ...
	dey
	dey
	dex
	bpl .loop
	rtl

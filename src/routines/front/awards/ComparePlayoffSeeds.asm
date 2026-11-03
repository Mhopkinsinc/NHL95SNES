ComparePlayoffSeeds:				; compares two team records using the playoff seeding tiebreak order
	lda.w $000A,x
	cmp.w $000A,y
	beq .1
	rts
.1:									; if $0004,x = $0004,y go to .2, return
	lda.w $0004,x
	cmp.w $0004,y
	beq .2
	rts
.2:									; if $0008,x = $0008,y go to .3, return
	lda.w $0008,x
	cmp.w $0008,y
	beq .3
	rts
.3:									; if $000E,x = $000E,y go to .4, return
	lda.w $000E,x
	cmp.w $000E,y
	beq .4
	rts
.4:									; if $002A,y = $002A,x go to .5, return
	lda.w $002A,y
	cmp.w $002A,x
	beq .5
	rts
.5:									; if $0018,x = $0018,y go to .6, return
	lda.w $0018,x
	cmp.w $0018,y
	beq .6
	rts
.6:									; return
	lda.w $001C,x
	cmp.w $001C,y
	rts

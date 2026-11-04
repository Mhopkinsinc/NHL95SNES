vtoa:								; from ReadReplayCameraInput and other segments
	lda.w #$FFFF
	bit.b d0
	bpl .3
	bit.b d1
	bpl .1
	lda.w #$0005
	sta.b d0
	rtl
.1:									; if zero go to .2, d0 = $0007, return
	beq .2
	lda.w #$0007
	sta.b d0
	rtl
.2:									; d0 = $0006, return
	lda.w #$0006
	sta.b d0
	rtl
.3:									; if zero go to .6, if plus go to .4, d0 = $0003, return
	beq .6
	bit.b d1
	bpl .4
	lda.w #$0003
	sta.b d0
	rtl
.4:									; if zero go to .5, d0 = $0001, return
	beq .5
	lda.w #$0001
	sta.b d0
	rtl
.5:									; d0 = $0002, return
	lda.w #$0002
	sta.b d0
	rtl
.6:									; if d1 bits clear go to .8, if plus go to .7, d0 = $0004, return
	bit.b d1
	beq .8
	bpl .7
	lda.w #$0004
	sta.b d0
	rtl
.7:									; A + 1, d0 = A, return
	inc a
	sta.b d0
	rtl
.8:									; d0 = $0008, return
	lda.w #$0008
	sta.b d0
	rtl

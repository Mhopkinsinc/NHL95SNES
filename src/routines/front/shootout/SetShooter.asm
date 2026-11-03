SetShooter:							; puts the list player at row curplayer into shooter slot curitem
									; (homeshooters / awayshooters by a2), swapping him out of any other slot
	ldy.b d1
	phy
	lda.w #$0009
	sec
	sbc.w curplayer
	clc
	adc.w picktop
	and.w #$00FF
	sta.b d0
	lda.w #$0000
	sta.b a1+2
	lda.w #homeshooters
	sta.b a1
	lda.b a2
	beq .1
	lda.w #$0000
	sta.b a1+2
	lda.w #awayshooters
	sta.b a1
.1:									; Y = curitem, A 8-bit, A = [a1],y, A 16-bit, ...
	ldy.w curitem
	sep #$20
	lda.b [a1],y
	rep #$20
	and.w #$00FF
	sta.b d1
	lda.b d0
	ldy.w #$0001
.loop:								; loop: A 8-bit, A 16-bit, if zero go to .2, Y + 1, ...
	sep #$20
	cmp.b [a1],y
	rep #$20
	beq .2
	iny
	cpy.w #$0007
	bmi .loop
	bra .3
.2:									; A = d1, A 8-bit, [a1],y = A, A 16-bit
	lda.b d1
	sep #$20
	sta.b [a1],y
	rep #$20
.3:									; Y = curitem, A = d0, A 8-bit, [a1],y = A, ...
	ldy.w curitem
	lda.b d0
	sep #$20
	sta.b [a1],y
	rep #$20
	pla
	sta.b d1
	rtl

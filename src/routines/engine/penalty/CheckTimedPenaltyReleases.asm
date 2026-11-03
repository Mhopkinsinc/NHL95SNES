CheckTimedPenaltyReleases:			; check the players whose ordinary penalties were timed for release
	lda.w mesarea
	sta.b d0
	lda.b d1
	cmp.w #$0001
	beq ReleaseExpiredPenalty
	lda.b d1
	bne .1
	jsl.l ReleaseExpiredPenalty
	bra .2
.1:									; if d1 is not $FFFF go to PenaltyTimeReturn
	lda.b d1
	cmp.w #$FFFF
	bne PenaltyTimeReturn
.2:									; d0 = $04F7
	lda.w mesarea+2
	sta.b d0
ReleaseExpiredPenalty:				; release the selected player when the penalty time reaches zero
	lda.b a2
	beq .1
	lda.w #$0034
.1:									; A + d0, Y = A, if tmpdst,y - $0006 >= 0 go to PenaltyTimeReturn, ...
	clc
	adc.b d0
	tay
	lda.w tmpdst,y
	cmp.w #$0006
	bpl PenaltyTimeReturn
	lda.w tmpdst,y
	bne .rtl
	jsl.l releasepl
.rtl:								; return
	rtl

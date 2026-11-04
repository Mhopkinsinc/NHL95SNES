InsertPlayoffSeed:					; inserts a team record into the ranked playoff seed pointers
	ldx.w #$000E
.1:									; if ScratchBuf,x = 0 go to .2, tmp1 = X, X = A, ...
	lda.w ScratchBuf,x
	beq .2
	stx.b tmp1
	tax
	jsr.w ComparePlayoffSeeds
	bcs .3
	sty.b tmp2
	ldy.w #ScratchBuf
	ldx.w #ScratchBuf+$2
	lda.b tmp1
	inc a
	mvn $7E,$7E
	ldy.b tmp2
	ldx.b tmp1
.2:									; A = Y, ScratchBuf,x = A, return
	tya
	sta.w ScratchBuf,x
	rts
.3:									; X = tmp1, X - 1, X - 1, if the result >= 0 go to .1, ...
	ldx.b tmp1
	dex
	dex
	bpl .1
	rts

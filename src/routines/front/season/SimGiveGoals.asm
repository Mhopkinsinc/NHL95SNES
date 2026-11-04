SimGiveGoals:						; gives SimGiveCount goals one at a time to random players of the pick
									; table (BuildSimPickTable): + 1 at + $3A
	lda.w SimGiveCount
	beq .rts
	jsr.w BuildSimPickTable
.1:									; A = SimPickTotal, call RandomBelowA7E, X = $0000
	lda.w SimPickTotal
	jsr.w RandomBelowA7E
	ldx.w #$0000
.loop:								; loop: if A < SimTable,x go to .2, if zero go to .2, X + 1, X + 1, ...
	cmp.w SimTable,x
	bcc .2
	beq .2
	inx
	inx
	inx
	inx
	bra .loop
.2:									; A = SimTable+$2,x, A + $0E, X = A, $003A,x + 1, ...
	lda.w SimTable+$2,x
	clc
	adc.b $0E
	tax
	inc.w $003A,x
	dec.w SimGiveCount
	bne .1
.rts:								; return
	rts

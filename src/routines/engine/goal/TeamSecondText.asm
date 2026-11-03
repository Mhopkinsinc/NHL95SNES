TeamSecondText:						; X = the second packed string of team A's text list (A 0 home, else away;
									; team data +2, the first string skipped)
	ldx.w HomeTeam
	cmp.w #$0000
	beq .1
	ldx.w VisTeam
.1:									; A = X, A * 2, X = A, A = $C30000,x, ...
	txa
	asl a
	tax
	lda.l $C30000,x
	tax
	lda.l $C30002,x
	tax
SkipPackedText:						; X past the packed (5-bit) text string at X: symbols read until the end
									; code $1A, the punctuation escapes ($1D on) with their 3 extra bits
	ldy.w #$0000
.loop:								; loop: call SkipNextSymbol, if A < $001D go to .1, ...
	jsr.w SkipNextSymbol
	cmp.w #$001D
	bcc .1
	jsr.w SkipThreeBits
	bra .loop
.1:									; if A is not $001A go to .loop, if Y = $0000 go to .rts, X + 1
	cmp.w #$001A
	bne .loop
	cpy.w #$0000
	beq .rts
	inx
.rts:								; return
	rts

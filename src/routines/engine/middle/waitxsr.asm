waitxsr:							; no caller found (not traced)
	phx
	pei ($7F)
.loop:								; loop: X = $0000
	ldx.w #$0000
.loop2:								; loop: A = X, A * 2, Y = A, if cont1team,y = 0 go to .1, ...
	txa
	asl a
	tay
	lda.w cont1team,y
	beq .1
	txa
	jsl.l ReadjoyA
	lda.b d3
	bne .2
.1:									; X + 1, if X < $0005 go to .loop2, $28 = OAMBuf+$1FF, ...
	inx
	cpx.w #$0005
	bcc .loop2
	lda.w #OAMBuf+$1FF
	sta.b $28
	lda.w #OAMHighBytes
	sta.b $2A
	jsl.l setvideo
	lda.b Vcount
.loop3:								; loop: if A = Vcount go to .loop3, call ReadPads, pull A, A - 1, ...
	cmp.b Vcount
	beq .loop3
	jsl.l ReadPads
	pla
	dec a
	pha
	bpl .loop
.2:									; pull A, pull X, return
	pla
	plx
	rtl

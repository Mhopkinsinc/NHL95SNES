PrintLineNames:						; prints the line being edited: its title (Best Line with line changes
									; off, else the line's name by $79), then each slot's row (PrintLineSlot),
									; the cursor row ($69) highlighted
	lda.w #$0020
	sta.b $CF
	lda.w #$00A8
	sta.b $D1
	lda.w OptLine
	bne .1
	ldx.w #$4C74
	bra .2
.1:									; A = $79, A + 1, A * 2, X = A, ...
	lda.b $79
	inc a
	asl a
	tax
	lda.l LineNames,x
	tax
.2:									; Y = $0008, call PrintItalicLeft, Y = $000A, call PrintTitleBar, ...
	ldy.w #$0008
	jsl.l PrintItalicLeft
	ldy.w #$000A
	jsl.l PrintTitleBar
	lda.w #$000D
	sta.b a2+2
	stz.b a3
.loop:								; loop: X = $2400, if a3 = a1+2 go to .3, X = $2000
	ldx.w #$2400
	lda.b a3
	cmp.b a1+2
	beq .3
	ldx.w #$2000
.3:									; $D5 = X, call PrintLineSlot, a2+2 + 1, A = a3, ...
	stx.b $D5
	jsr.w PrintLineSlot
	inc.b a2+2
	lda.b a3
	inc a
	sta.b a3
	cmp.w #$0005
	bcs .4
	ldx.b $79
	cpx.w #$0005
	bcc .loop
	cmp.w #$0004
	bcc .loop
.4:									; A - 1, a1 = A, $D5 = $2000, return
	dec a
	sta.b a1
	lda.w #$2000
	sta.b $D5
	rts

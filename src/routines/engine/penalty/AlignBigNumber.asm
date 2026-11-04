AlignBigNumber:						; no caller found (not traced)
	ldy.w #$0002
.loop:								; loop: printx - 1, A = [a1],y, A and $00FF, if A = $0031 go to .1, ...
	dec.w printx
	lda.b [a1],y
	and.w #$00FF
	cmp.w #$0031
	beq .1
	dec.w printx
.1:									; Y + 1, A = Y, if A < [a1] go to .loop, return
	iny
	tya
	cmp.b [a1]
	bcc .loop
	rtl

NextOptionValue:					; setup screen right: the variable of line d6 one value on (0 past the
									; last), then the line's check routine (the word before its routine
									; address), the redraw (DrawSetupLine) and the routine
	lda.b d6
	asl a
	asl a
	asl a
	adc.b a3
	tax
	phx
	lda.l $C30006,x
	tay
	lda.l $C30004,x
	tax
	lda.w $0000,y
	inc a
	cmp.l $C30000,x
	bcc .1
	lda.w #$0000
.1:									; $0000,y = A, pull X, if $C30008,x = 0 go to DrawSetupLineJump, ...
	sta.w $0000,y
	plx
	lda.l $C30008,x
	beq DrawSetupLineJump
	tax
	lda.l $C4FFFE,x
	beq SetupOptionRunRoutine
	dex
	phx
	pea.w $904C
	dec a
	pha
	rts

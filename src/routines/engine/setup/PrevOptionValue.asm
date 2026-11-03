PrevOptionValue:					; setup screen left: the variable of line d6 one value back (the last
									; below 0), then the line's check routine (the word before its routine
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
	lda.w $0000,y
	dec a
	bpl .1
	lda.l $C30004,x
	tax
	lda.l $C30000,x
	dec a
.1:									; $0000,y = A, pull X, if $C30008,x = 0 go to .2, X = A, ...
	sta.w $0000,y
	plx
	lda.l $C30008,x
	beq .2
	tax
	lda.l $C4FFFE,x
	beq SetupOptionRunRoutine
	dex
	phx
	pea.w $904C
	dec a
	pha
	rts
.2:									; go to DrawSetupLine
	jmp.w DrawSetupLine

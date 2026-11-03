IntroColourFlashTask:				; plays the intro fixed-colour flash and removes itself at the terminator
	and.w #$00FF
	sep #$20
	lda.w $0008,x
	tax
	lda.l IntroFlashLevels,x
	beq .1
	sta.l $002132
	lda.b #$01
	sta.l $002131
	dec a
	sta.l $002130
	rep #$20
	rtl
.1:									; $002131 = A, $002132 = $E0, A 16-bit, go to RemoveTask
	sta.l $002131
	lda.b #$E0
	sta.l $002132
	rep #$20
	jmp.w RemoveTask

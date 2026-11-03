QueueFadeStep:						; one step of a 16-colour fade: StepColourFade, PackFadeColours into d4,
									; QueueColours16 to CGRAM at Y; $7D - 1
	pha
	lda.w #$0010
	sta.b d3
	ldy.b d5
	jsl.l StepColourFade
	ldx.w #$007E
	lda.b d4
	ldy.b d5
	jsl.l PackFadeColours
	ldx.w #$007E
	lda.b d4
	ply
	jsl.l QueueColours16
	dec.b $7D
	rts

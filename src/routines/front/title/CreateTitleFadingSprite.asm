CreateTitleFadingSprite:			; creates a title sprite with a black palette and starts its colour fade
	jsl.l CreateSprite
	stx.b d4+2
	lda.w #$0010
	sta.b d3
	lda.b d4
	ldy.w #$0000
	jsl.l FillWords7E
	lda.w #$007E
	sta.b a3+2
	lda.b d4
	sta.b a3
	lda.w #$0020
	sta.b $7D
	ldx.b d4+2
	ldy.w $0034,x
	lda.l $008004
	and.w #$00FF
	tax
	tya
	and.w #$00FF
	xba
	lsr a
	lsr a
	lsr a
	adc.l $008002
	ldy.b d5
	jsl.l StartColourFade
	ldx.b d4+2
	lda.w $0034,x
	and.w #$FF00
	xba
	clc
	adc.w #$0008
	asl a
	asl a
	asl a
	asl a
	tay
	ldx.w #$007E
	lda.b d4
	jsl.l QueueColours16
	rts

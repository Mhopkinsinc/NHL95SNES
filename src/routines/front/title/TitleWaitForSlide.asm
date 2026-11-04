TitleWaitForSlide:					; waits for the task counter to reach 60 before starting the title fade
									; and slide
	lda.w $0008,x
	cmp.w #$003C
	bne TitleSlideBG2Return
	stz.w $0008,x
	lda.w #TitleFadeAndSlide
	sta.w $0002,x
TitleFadeAndSlide:					; steps the title palette fade and continues into the background slide
	lda.w #$0020
	jsr.w QueueFadeStep
	bne TitleSlideBG2
	ldx.b d1
	lda.w #TitleSlideBG2
	sta.w $0002,x
TitleSlideBG2:						; advances BG2 horizontal scroll by two until the next title slide phase
	lda.w BG2HScroll
	inc a
	inc a
	sta.w BG2HScroll
	cmp.w #$0080
	bcc TitleSlideBG2Return
	ldx.b d1
	lda.w #TitleSlideBothBGs
	sta.w $0002,x
TitleSlideBG2Return:				; the rtl TitleSlideBG2 ends with, shared by TitleWaitForSlide and
									; TitleSlideBothBGs
	rtl

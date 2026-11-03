TitleEndDelay:						; ends the title task sequence after the final delay
	lda.w $0008,x
	cmp.w #$01E0
	bne TitleEndDelayReturn
	lda.w #$8000
	trb.b d1+2
TitleEndDelayReturn:				; the rtl TitleEndDelay ends with, shared by TitleHoldTextPage and
									; TitleFadeTextOut
	rtl

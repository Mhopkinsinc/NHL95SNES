BreakawayGlideStopped:				; glide and suspend puck pickup while breakaway play is stopped
	jsl.l GlideBack
	lda.w #$003C
	sta.w nopuck,x
	jmp.w donothing

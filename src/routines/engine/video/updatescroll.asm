updatescroll:						; sets the rink scroll from the camera position: Hscroll = Hpos - $80,
									; Vscroll = -Vpos - $70
	sec
	lda.b Hpos
	sbc.w #$0080
	sta.w Hscroll
	sec
	lda.w #$FF90
	sbc.b Vpos
	sta.w Vscroll
	rtl

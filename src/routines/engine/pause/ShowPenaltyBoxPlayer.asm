ShowPenaltyBoxPlayer:				; player X's jersey number and penalty time (tmpdst A) as tiles queued to
									; VRAM at the box row (tmp1 + tmp2), then a row down; nothing once tmp2
									; reaches $200
	phy
	ldy.b tmp2
	cpy.w #$0200
	bcc ShowPenaltyBoxPlayerBody
	ply
rtsmenu:							; the rts ShowPenaltyBox's second pass and a full ShowPenaltyBoxPlayer
									; leave through
	rts

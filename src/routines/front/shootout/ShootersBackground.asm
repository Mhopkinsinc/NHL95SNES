ShootersBackground:					; the shooters screen background: DrawShootersBack when drawlinesback is
									; set, d1 = HomeTeam or VisTeam by a2, then irqline2 $50
	lda.w drawlinesback
	beq .1
	jsl.l DrawShootersBack
.1:									; X = $0058, Y = $0018, d1 = HomeTeam, if a2 = 0 go to .2, ...
	ldx.w #$0058
	ldy.w #$0018
	lda.w HomeTeam
	sta.b d1
	lda.b a2
	beq .2
	lda.w VisTeam
	sta.b d1
.2:									; if drawlinesback = 0 go to .rtl, call WaitFrame, irqline2 = $0050, ...
	lda.w drawlinesback
	beq .rtl
	jsl.l WaitFrame
	lda.w #$0050
	sta.w irqline2
	stz.w drawlinesback
.rtl:								; return
	rtl

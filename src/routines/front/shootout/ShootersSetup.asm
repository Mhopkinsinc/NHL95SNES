ShootersSetup:						; ShootoutShooters' set-up: the eraser box ($20 x $0D, a bare rtl here),
									; printa $0800, then ShootersBackground
	lda.w #$0020
	sta.b d0
	lda.w #$000D
	sta.b d1
	lda.w blankchar
	sta.b d2
	jsl.l eraser
	lda.w #$0800
	sta.w printa
	lda.w #$000E
	sta.b d0
	lda.w #$0003
	sta.b d1
	jsl.l ShootersBackground
	rtl

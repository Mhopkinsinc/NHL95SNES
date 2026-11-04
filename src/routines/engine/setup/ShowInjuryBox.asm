ShowInjuryBox:						; the injury box: a frame, its two texts (a third one when TempPlOffset
									; has bit $4000) and the injured player's short name
	pei ($7F)
	pei ($81)
	pei ($83)
	pei ($85)
	pei ($87)
	pei ($89)
	pei ($63)
	pei ($65)
	pei ($67)
	pei ($69)
	pei ($6B)
	pei ($6D)
	pei ($6F)
	pei ($71)
	pei ($73)
	pei ($75)
	inc.w LCBoxesClosed
	lda.w #$58CA
	ldx.w #$0012
	ldy.w #$0004
	jsl.l Framer
	lda.w #$5F1D
	ldx.w #$00C3
	ldy.w #$590B
	jsl.l QueueVRAMDMALen
	lda.w #$5F28
	ldx.w #$00C3
	ldy.w #$58EB
	jsl.l QueueVRAMDMALen
	lda.w TempPlOffset
	bit.w #$4000
	beq .1
	and.w #$BFFF
	sta.w TempPlOffset
	lda.w #$5F37
	ldx.w #$00C3
	ldy.w #$58F3
	jsl.l QueueVRAMDMALen
.1:									; call RosterPlayerShortName, Y = $592B, call QueueVRAMDMALen, pull A, ...
	jsl.l RosterPlayerShortName
	ldy.w #$592B
	jsl.l QueueVRAMDMALen
	pla
	sta.b $75
	pla
	sta.b a4
	pla
	sta.b a3+2
	pla
	sta.b a3
	pla
	sta.b a2+2
	pla
	sta.b a2
	pla
	sta.b a1+2
	pla
	sta.b a1
	pla
	sta.b a0+2
	pla
	sta.b a0
	pla
	sta.b d2+2
	pla
	sta.b d2
	pla
	sta.b d1+2
	pla
	sta.b d1
	pla
	sta.b d0+2
	pla
	sta.b d0
	ldx.b a3
	rtl

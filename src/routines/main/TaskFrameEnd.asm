TaskFrameEnd:						; the last task of the list: the sprites to OAM (when task flag bit 1 is
									; set), then waits for the frame
	lda.b d1+2
	bit.w #$0002
	beq .1
	lda.w #OAMBuf+$1FF
	sta.b $28
	lda.w #OAMHighBytes
	sta.b $2A
	jsl.l BuildSpriteOAM
	jsl.l PackOAMHigh
.1:									; TransfersReady + 1, d3 = $F254, return
	inc.w TransfersReady
	wai
	lda.w #$F254
	sta.b d3
	rtl

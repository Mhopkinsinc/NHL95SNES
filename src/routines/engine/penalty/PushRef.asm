PushRef:							; draw a referee frame or clear the referee window
	lda.b tmp0
	cmp.w #$0040
	beq .2
	cmp.w #$0014
	beq .1
	lda.w #$0001
	sta.w refwindow
.1:									; A = tmp0, A * 2, X = A, A = RefFrameOffsets,x, ...
	lda.b tmp0
	asl a
	tax
	lda.l RefFrameOffsets,x
	tax
	ldy.w #$5842
	jsr.w CopyRefereeFrameToVRAM
	lda.w #$0200
	tsb.w sflags
	rtl
.2:									; if penmsgbox = 0 go to .3, call ClearRefereeMessage
	lda.w penmsgbox
	beq .3
	jsl.l ClearRefereeMessage
.3:									; TransfersReady + 1, X = $001C, Y = $5842, ...
	inc.w TransfersReady
	ldx.w #$001C
	ldy.w #$5842
	jsr.w CopyRefereeFrameToVRAM
	lda.w #$0200
	tsb.w sflags
	stz.w refwindow
	rtl

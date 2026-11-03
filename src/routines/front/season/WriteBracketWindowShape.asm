WriteBracketWindowShape:			; writes clipped window edges for the bracket shape into the active HDMA
									; buffer
	stx.b tmp0
	lda.b $26
	lsr a
	tya
	bcs .1
	adc.w #$00E0
.1:									; A * 2, A * 2, Y = A, X = $0054
	asl a
	asl a
	tay
	ldx.w #$0054
.2:									; if zero go to .6, A = BracketWindowShape,x, A and $00FF, A + tmp0, ...
	lda.w ScratchBuf,y
	cmp.w #$00FF
	clc
	beq .6
	lda.l BracketWindowShape,x
	and.w #$00FF
	adc.b tmp0
	bpl .3
	lda.w #$0000
.3:									; if A >= $0100 go to .10, A 8-bit, ScratchBuf+$2,y = A, ...
	cmp.w #$0100
	bcs .10
	sep #$20
	sta.w ScratchBuf+$2,y
	rep #$21
	lda.l BracketWindowShape+1,x
	and.w #$00FF
	adc.b tmp0
	bpl .4
	lda.w #$00FF
	sta.w ScratchBuf+$2,y
	bra .10
.4:									; if A < $0100 go to .5, A = $00FF
	cmp.w #$0100
	bcc .5
	lda.w #$00FF
.5:									; A 8-bit, ScratchBuf+$3,y = A, A 16-bit, go to .10
	sep #$20
	sta.w ScratchBuf+$3,y
	rep #$20
	bra .10
.6:									; A = BracketWindowShape,x, A and $00FF, A + tmp0, ...
	lda.l BracketWindowShape,x
	and.w #$00FF
	adc.b tmp0
	bpl .7
	lda.w #$0000
.7:									; if A >= $0100 go to .10, A 8-bit, ScratchBuf,y = A, ...
	cmp.w #$0100
	bcs .10
	sep #$20
	sta.w ScratchBuf,y
	rep #$21
	lda.l BracketWindowShape+1,x
	and.w #$00FF
	adc.b tmp0
	bpl .8
	lda.w #$00FF
	sta.w ScratchBuf,y
	bra .10
.8:									; if A < $0100 go to .9, A = $00FF
	cmp.w #$0100
	bcc .9
	lda.w #$00FF
.9:									; A 8-bit, ScratchBuf+$1,y = A, A 16-bit
	sep #$20
	sta.w ScratchBuf+$1,y
	rep #$20
.10:								; A = Y, A + $0004, Y = A, X - 1, ...
	clc
	tya
	adc.w #$0004
	tay
	dex
	dex
	bmi .rts
	jmp.w .2
.rts:								; return
	rts

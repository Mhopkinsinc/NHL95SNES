AppendScoutPlayerTrio:				; appends three player names with separators to the scouting text
	pha
	tax
	lda.w $0000,x
	jsr.w AppendScoutPlayerName
	lda.w #$2040
	sta.w ScratchBuf,y
	iny
	iny
	sty.b d0+2
	lda.b $01,s
	tax
	lda.w $0002,x
	jsr.w AppendScoutPlayerName
	lda.w #$2040
	sta.w ScratchBuf,y
	lda.w #$6E61
	sta.w ScratchBuf+$2,y
	lda.w #$2064
	sta.w ScratchBuf+$4,y
	tya
	clc
	adc.w #$0006
	tay
	sty.b d0+2
	plx
	lda.w $0004,x
AppendScoutPlayerName:				; appends the roster player name selected by the doubled player index in A
	asl a
	asl a
	asl a
	asl a
	adc.b d0
	adc.w #$0118
	tax
	bra AppendScoutString

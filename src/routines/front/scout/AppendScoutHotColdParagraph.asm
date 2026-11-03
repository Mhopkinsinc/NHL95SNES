AppendScoutHotColdParagraph:		; appends a team's name and its hot and cold player trios to the scouting
									; text
	phx
	pha
	lda.w #$6F46
	sta.w ScratchBuf,y
	lda.w #$2072
	sta.w ScratchBuf+$2,y
	iny
	iny
	iny
	iny
	sty.b d0+2
	pla
	asl a
	tax
	lda.l $C30000,x
	tax
	lda.l $C30002,x
	tax
	jsr.w AppendScoutText
	lda.w #$2040
	sta.w ScratchBuf,y
	iny
	iny
	sty.b d0+2
	lda.b $01,s
	jsr.w AppendScoutPlayerTrio
	ldx.w #TxtAreOnHotStreaksAnd&$FFFF
	jsr.w AppendScoutText
	pla
	clc
	adc.w #$0006
	jsr.w AppendScoutPlayerTrio
	ldx.w #TxtAreOffTheirGame&$FFFF
	jmp.w AppendScoutText

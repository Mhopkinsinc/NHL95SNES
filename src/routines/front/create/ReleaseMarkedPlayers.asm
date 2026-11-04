ReleaseMarkedPlayers:				; start on Release Players: each marked player (ScratchBuf bit 0) gets
									; team $1A (free agent) in SRPlayerTeams; then GameSetUp
	ldy.w #$FFFF
.1:									; Y + 1, if Y is not a1 go to .2, go to GameSetUp
	iny
	cpy.b a1
	bne .2
	jmp.w GameSetUp
.2:									; A = ScratchBuf,y, if $0001 bits clear go to .1, A = Y, A * 2, ...
	lda.w ScratchBuf,y
	bit.w #$0001
	beq .1
	tya
	asl a
	tax
	lda.w VisRoster+58,x
	sta.b tmp0
	lsr a
	bcc .3
	clc
	adc.b tmp0
	tax
	lda.l SRPlayerTeams,x
	and.w #$FE0F
	ora.w #$01A0
	sta.l SRPlayerTeams,x
	bra .1
.3:									; A + tmp0, X = A, A = SRPlayerTeams,x, A and $FFE0, ...
	adc.b tmp0
	tax
	lda.l SRPlayerTeams,x
	and.w #$FFE0
	ora.w #$001A
	sta.l SRPlayerTeams,x
	bra .1

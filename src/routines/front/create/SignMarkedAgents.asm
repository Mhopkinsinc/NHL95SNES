SignMarkedAgents:					; start on Hire Free Agents: each marked free agent (ScratchBuf bit $40)
									; goes to VisTeam in SRPlayerTeams with the first number from its own up
									; that VisTeam has free; then GameSetUp
	lda.w VisTeam
	asl a
	asl a
	asl a
	asl a
	sta.b tmp1
	ldx.b a1
.1:									; X - 1, if the result >= 0 go to .2, go to GameSetUp
	dex
	bpl .2
	jmp.w GameSetUp
.2:									; a1 = X, a0+2 = X, A = ScratchBuf,x, if $0040 bits clear go to .1, ...
	stx.b a1
	stx.b a0+2
	lda.w ScratchBuf,x
	bit.w #$0040
	beq .1
	jsr.w FindFreeAgent
	sta.b tmp0
	lsr a
	bcc .3
	clc
	adc.b tmp0
	tax
	lda.l SRPlayerTeams,x
	and.w #$000F
	ora.w #$FE00
	ora.b tmp1
	sta.l SRPlayerTeams,x
	bra .4
.3:									; A + tmp0, X = A, A = SRPlayerTeams,x, A and $F000, ...
	adc.b tmp0
	tax
	lda.l SRPlayerTeams,x
	and.w #$F000
	ora.w #$0FE0
	ora.w VisTeam
	sta.l SRPlayerTeams,x
.4:									; if tmp0 < $026A go to .5, call CreatedPlayerBits, A = Y, A + $005D, ...
	lda.b tmp0
	cmp.w #$026A
	bcc .5
	jsr.w CreatedPlayerBits
	tya
	clc
	adc.w #$005D
	tay
	jsr.w NextSaveBits7
	bra .loop
.5:									; A * 2, A + $0038, X = A, A = $C30000,x, ...
	asl a
	adc.w #$0038
	tax
	lda.l $C30000,x
	and.w #$3FFF
	tax
	lda.l $C30000,x
	and.w #$00FF
.loop:								; loop: tmp2 = A, call JerseyNumberTaken, if carry clear go to .6, ...
	sta.b tmp2
	jsr.w JerseyNumberTaken
	bcc .6
	lda.b tmp2
	inc a
	cmp.w #$0064
	bcc .loop
	lda.w #$0000
	bra .loop
.6:									; A = tmp0, A / 2, if carry clear go to .7, A + tmp0, ...
	lda.b tmp0
	lsr a
	bcc .7
	clc
	adc.b tmp0
	tax
	lda.b tmp2
	xba
	asl a
	sta.b tmp2
	lda.l SRPlayerTeams,x
	and.w #$01FF
	ora.b tmp2
	sta.l SRPlayerTeams,x
	ldx.b a1
	jmp.w .1
.7:									; A + tmp0, X = A, A = tmp2, A * 2, ...
	adc.b tmp0
	tax
	lda.b tmp2
	asl a
	asl a
	asl a
	asl a
	asl a
	sta.b tmp2
	lda.l SRPlayerTeams,x
	and.w #$F01F
	ora.b tmp2
	sta.l SRPlayerTeams,x
	ldx.b a1
	jmp.w .1
	jmp.w GameSetUp					; unreached: no code branches, falls or points here

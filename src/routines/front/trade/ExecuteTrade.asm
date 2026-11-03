ExecuteTrade:						; does the trade: each chosen player's team in the player team table goes
									; to the other team
	lda.b $7B
	sta.b tmp0
	ldx.w #HomeRoster
	ldy.w #ScratchBuf
	lda.w VisTeam
	jsr.w SetMarkedPlayersTeam
	lda.b $7D
	sta.b tmp0
	ldx.w #VisRoster
	ldy.w #ScratchBuf+$64
	lda.w HomeTeam
SetMarkedPlayersTeam:				; each player marked in the list at Y (bit 0; roster X) gets team A in his
									; SRPlayerTeams entry
	stx.b tmp2
	sty.b tmp1
	sta.b tmp3
	asl a
	asl a
	asl a
	asl a
	sta.b $0A
	ldy.w #$0000
.1:									; A = (tmp1),y, if $0001 bits clear go to .3, A = Y, A * 2, ...
	lda.b (tmp1),y
	bit.w #$0001
	beq .3
	tya
	asl a
	adc.b tmp2
	tax
	lda.w $003A,x
	sta.b $0C
	lsr a
	bcc .2
	clc
	adc.b $0C
	tax
	lda.l SRPlayerTeams,x
	and.w #$FE0F
	ora.b $0A
	sta.l SRPlayerTeams,x
	bra .3
.2:									; A + $0C, X = A, A = SRPlayerTeams,x, A and $FFE0, ...
	adc.b $0C
	tax
	lda.l SRPlayerTeams,x
	and.w #$FFE0
	ora.b tmp3
	sta.l SRPlayerTeams,x
.3:									; Y + 1, if Y is not tmp0 go to .1, return
	iny
	cpy.b tmp0
	bne .1
	rts

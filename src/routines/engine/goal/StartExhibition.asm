StartExhibition:					; play mode Exhibition (PlayModeStarts): SetContTeams with up to 5 pads a
									; team; the demo (StartDemo) and a user's season game (FinishSeasonDay)
									; start here too
	lda.w #$0005
	sta.b d0
	sta.b d0+2
SetContTeams:						; the controller setup: each pad's icon is moved to a team; on start /
									; select its place sets cont1team (0 none, 1, 2)
	stz.b d1
	stz.b d1+2
	jsr.w ControllerSetupScreen
.loop:								; loop: call ReadPads, call WaitTransfers, $26 + 1, ...
	jsl.l ReadPads
	jsl.l WaitTransfers
	inc.b $26
	jsl.l AnimateSprites
	lda.w #OAMBuf+$1FF
	sta.b $28
	lda.w #OAMHighBytes
	sta.b $2A
	jsr.w ShowConnectedPads
	jsr.w MovePadIcons
	jsl.l BuildSpriteOAM
	jsl.l PackOAMHigh
	lda.l $7E23BA
	bne .1
	lda.b $7D
	bit.w #$3000
	beq .loop
.1:									; Y = $0008
	ldy.w #$0008
.loop2:								; loop: X = $73,y, cont1team,y = $0000, A = $22,x, A / 2, ...
	ldx.b $73,y
	lda.w #$0000
	sta.w cont1team,y
	lda.b $22,x
	lsr a
	bcc .3
	lda.b $05,x
	cmp.w #$0080
	beq .3
	lda.w #$0002
	bcc .2
	dec a
.2:									; cont1team,y = A
	sta.w cont1team,y
.3:									; Y - 1, Y - 1, if the result >= 0 go to .loop2, call UserNameEntry, ...
	dey
	dey
	bpl .loop2
	jsr.w UserNameEntry
	lda.w OptPlayMode
	jsl.l SoundVolumeDown
	jsl.l FadeOutWait
	jsl.l forceblack
	jsl.l ResetSprites
	lda.w #$0040
	sta.b $20
	lda.w #$0044
	sta.b $1E
	lda.w #$001D
	jsl.l CreateSpriteSharePal
	lda.w #$0081
	sta.w HomeSpritePal
	jsl.l UseSpritePalette
	lda.w #$0080
	sta.w VisSpritePal
	jsl.l UseSpritePalette
	lda.w #$FFFF
	sta.b $0A,x
	stz.b $20
	stz.b $1E
	jml.l ResetWorkBuf

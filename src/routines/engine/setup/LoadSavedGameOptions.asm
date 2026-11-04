LoadSavedGameOptions:				; load and clamp the saved game options
	lda.l SRHomeTeam
	cmp.w #$001C
	bcc .1
	lda.w #$001B
.1:									; HomeTeam = A, if SRVisTeam < $001C go to .2, A = $001B
	sta.w HomeTeam
	lda.l SRVisTeam
	cmp.w #$001C
	bcc .2
	lda.w #$001B
.2:									; VisTeam = A, A = SRBestOfSeven, A and $0001, OptPlayoffs = A, ...
	sta.w VisTeam
	lda.l SRBestOfSeven
	and.w #$0001
	sta.w OptPlayoffs
	lda.l SROptperlen
	and.w #$00FF
	cmp.w #$0003
	bcc .3
	lda.w #$0002
.3:									; Optperlen = A, A = SROptLine, A and $00FF, if A < $0003 go to .4, ...
	sta.w Optperlen
	lda.l SROptLine
	and.w #$00FF
	cmp.w #$0003
	bcc .4
	lda.w #$0002
.4:									; OptLine = A, A = SROptPen, A and $00FF, if A < $0003 go to .5, ...
	sta.w OptLine
	lda.l SROptPen
	and.w #$00FF
	cmp.w #$0003
	bcc .5
	lda.w #$0002
.5:									; OptPen = A, A = SROptGoalie, A and $0001, OptGoalie = A, ...
	sta.w OptPen
	lda.l SROptGoalie
	and.w #$0001
	sta.w OptGoalie
	lda.l SROptUserRec
	and.w #$0001
	sta.w OptUserRec
	lda.l SROptRosters
	and.w #$0001
	sta.w OptRosters
	lda.l SRhomepracplayers
	cmp.w #$0006
	bcc .6
	lda.w #$0005
.6:									; homepracplayers = A, if SRawaypracplayers < $0006 go to .7, A = $0005
	sta.w homepracplayers
	lda.l SRawaypracplayers
	cmp.w #$0006
	bcc .7
	lda.w #$0005
.7:									; awaypracplayers = A, if A is not $0000 go to .rtl, ...
	sta.w awaypracplayers
	cmp.w #$0000
	bne .rtl
	cmp.w homepracplayers
	bne .rtl
	inc a
	sta.w homepracplayers
.rtl:								; return
	rtl

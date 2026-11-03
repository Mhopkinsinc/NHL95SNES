doinput:							; called from other segments
	jsl.l setpads
	dec.b d4
	dec.b d4
	lda.b d3
	bit.w #$1000
	beq .1
	lda.b d4
	jmp.w PauseFromPad
.rtl:								; return
	rtl
.1:									; A = sflags, if $0100 bits clear go to .2, go to .9
	lda.w sflags
	bit.w #$0100
	beq .2
	jmp.w .9
.2:									; if asscur,x = $7D2E go to .rtl, push Y, Y = $0000, ...
	lda.w asscur,x
	cmp.w #$7D2E
	beq .rtl
	phy
	ldy.w #$0000
	lda.w pfteam,x
	beq .3
	ldy.w #$0002
.3:									; A = lcpad,y, pull Y, if lcpad,y - $0000 < 0 go to .4, ...
	lda.w lcpad,y
	ply
	cmp.w #$0000
	bmi .4
	cmp.b d4
	bne .6
.4:									; push Y, Y = $0000, if pfteam,x = 0 go to .5, Y = $0002
	phy
	ldy.w #$0000
	lda.w pfteam,x
	beq .5
	ldy.w #$0002
.5:									; A = tmflags,y, pull Y, if a $0008 bit set go to .10
	lda.w tmflags,y
	ply
	bit.w #$0008
	bne .10
.6:									; A = d1, if a $2000 bit set go to .17, if X is not puckc go to .7, ...
	lda.b d1
	bit.w #$2000
	bne .17
	cpx.w puckc
	bne .7
	jmp.w .22
.7:									; A = d1, if a $4000 bit set go to .11, ...
	lda.b d1
	bit.w #$4000
	bne .11
	lda.w pfalock,x
	bne .8
	lda.b d1
	bit.w #$0040
	bne .20
	bit.w #$8000
	bne .12
	lda.w position,x
	beq .15
	lda.b d1
	bit.w #$0020
	bne .13
	bit.w #$0010
	bne .14
	lda.w passReceiverPlayerNum
	cmp.b curobj
	beq .8
	lda.b d1
	bit.w #$0080
	bne .19
	jml.l doplayeracc
.8:									; go to .31
	jmp.w .31
.9:									; go to faceoffinput
	jml.l faceoffinput
.10:								; go to lineinput
	jml.l lineinput
.11:								; go to Holdplayer
	jml.l Holdplayer
.12:								; go to findpc
	jml.l findpc
.13:								; go to PadTakeLeftDefense
	jml.l PadTakeLeftDefense
.14:								; go to PadTakeRightDefense
	jml.l PadTakeRightDefense
.15:								; A = goalieflags,x, if a $0001 bit set go to .16, ...
	lda.w goalieflags,x
	bit.w #$0001
	bne .16
	and.w #$0002
	bne .rtl2
.16:								; go to doplayeracc
	jml.l doplayeracc
.rtl2:								; return
	rtl
.17:								; if gmclock is not 0 go to .rtl2, Y = $0000, ...
	lda.w gmclock
	bne .rtl2
	ldy.w #$0000
	lda.w pfteam,x
	beq .18
	ldy.w #$0002
.18:								; if lcpad,y >= 0 go to .rtl2, lcpad,y = d4, go to SetLCmode
	lda.w lcpad,y
	bpl .rtl2
	lda.b d4
	sta.w lcpad,y
	jmp.w SetLCmode
.19:								; go to burst
	jml.l burst
.20:								; Y = $0000, if X - $000C < 0 go to .21, Y = $0002
	ldy.w #$0000
	cpx.w #$000C
	bmi .21
	ldy.w #$0002
.21:								; if goaliemode1,y = 0 go to .rtl2, go to PadTakeGoalie
	lda.w goaliemode1,y
	beq .rtl2
	jml.l PadTakeGoalie
.22:								; if pfalock,x is not 0 go to .8, call checkob, ...
	lda.w pfalock,x
	bne .8
	jsl.l checkob
	lda.w position,x
	bne .23
	lda.w pf2aip,x
	bne .rtl2
.23:								; A = sflags, if a $0004 bit set go to .24, ...
	lda.w sflags
	bit.w #$0004
	bne .24
	bit.w #$0008
	bne .25
	lda.w dumpinplayer
	cmp.b curobj
	beq .rtl3
	lda.b d1
	bit.w #$8000
	bne .27
	bit.w #$4000
	bne .26
	lda.w position,x
	beq .30
	lda.b d1
	bit.w #$0080
	bne .29
	jml.l doplayeracc
.24:								; go to passmode
	jml.l passmode
.25:								; go to ShotMode
	jml.l ShotMode
.26:								; d0 = $0014, go to assinsert
	lda.w #$0014
	sta.b d0
	jml.l assinsert
.27:								; go to setpassmode
	jml.l setpassmode
.28:								; go to findpc
	jml.l findpc
.29:								; go to SetShotMode
	jml.l SetShotMode
.30:								; go to .15
	jmp.w .15
.rtl3:								; return
	rtl
.31:								; if X = puckc go to .rtl3, A = d1, if a $8000 bit set go to .28, ...
	cpx.w puckc
	beq .rtl3
	lda.b d1
	bit.w #$8000
	bne .28
	bit.w #$0040
	beq .32
	jmp.w .20
.32:								; if $0080 bits clear go to .rtl3, ...
	bit.w #$0080
	beq .rtl3
	ldy.w passReceiverPlayerNum
	bmi .rtl3
	lda.w pflags,y
	and.w #$1000
	ora.w pfalock,y
	bne .rtl3
	lda.w playerpad,y
	bpl .rtl3
	lda.w pfteam,y
	cmp.w pfteam,x
	bne .rtl3
	sty.b d0
	inc.w onetimerreq
	lda.w #$7FFF
	sta.w OneTimerDist
	jml.l AssignPadPlayer

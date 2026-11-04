Multi5Init:							; detect the multitap and initialize its pads and status
	pea.w $7E80
	plb
	jsl.l Multi5ConnectCheck
	lda.w #$000F
	sta.b PadRaw3
	sta.b PadRaw4
	sta.b PadRaw5
	stz.w mp5present
	stz.w mp5warning
	stz.w mp5checktimer
	stz.w mp5readdelay
	lda.w mp5connect
	and.w #$0080
	beq .1
	lda.w #$0001
	tsb.w mp5warning
	bra .2
.1:									; A = $0001
	lda.w #$0001
	trb.w mp5warning
.2:									; A = mp5connect, if the result = 0 go to .3, A = $0001, go to .4
	lda.w mp5connect
	and.w #$0040
	beq .3
	lda.w #$0001
	tsb.w mp5present
	bra .4
.3:									; A = $0001
	lda.w #$0001
	trb.w mp5present
.4:									; return
	plb
	rtl

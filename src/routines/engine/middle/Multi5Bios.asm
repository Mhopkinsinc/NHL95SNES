Multi5Bios:							; called from other segments
	php
	sep #$20
	rep #$10
	stz.w mp5padsig+3
	stz.w mp5padsig+4
.loop:								; loop: A = $4212, if the result is not 0 go to .loop, ...
	lda.w $4212
	and.b #$01
	bne .loop
	ldx.w $4218
	stx.b PadRaw1
	txa
	and.b #$0F
	sta.w mp5padsig
	lda.w JOYSER0
	lsr a
	rol.w mp5padsig
	ldx.w $421A
	stx.b PadRaw2
	txa
	and.b #$0F
	sta.w mp5padsig+1
	lda.w mp5present
	bne .1
	jmp.w .4
.1:									; PadRaw3 = $421E, A = X, A and $0F, mp5padsig+2 = A, ...
	ldx.w $421E
	stx.b PadRaw3
	txa
	and.b #$0F
	sta.w mp5padsig+2
	lda.w $4017
	lsr a
	rol.w mp5padsig+1
	lsr a
	rol.w mp5padsig+2
	stz.w $4201
	lda.w mp5readall
	ora.w mp5warning
	bne .3
	lda.w cont4team
	ora.w cont5team
	bne .3
	lda.w mp5readdelay
	beq .2
	dec a
	sta.w mp5readdelay
	jmp.w .5
.2:									; mp5readdelay = $1E
	lda.b #$1E
	sta.w mp5readdelay
.3:									; A = $4017, A / 2, A / 2, A = $4017, ...
	lda.w $4017
	lsr a
	rol.b $C8
	lsr a
	rol.b $CA
	lda.w $4017
	lsr a
	rol.b $C8
	lsr a
	rol.b $CA
	lda.w $4017
	lsr a
	rol.b $C8
	lsr a
	rol.b $CA
	lda.w $4017
	lsr a
	rol.b $C8
	lsr a
	rol.b $CA
	lda.w $4017
	lsr a
	rol.b $C8
	lsr a
	rol.b $CA
	lda.w $4017
	lsr a
	rol.b $C8
	lsr a
	rol.b $CA
	lda.w $4017
	lsr a
	rol.b $C8
	lsr a
	rol.b $CA
	lda.w $4017
	lsr a
	rol.b $C8
	lsr a
	rol.b $CA
	lda.w $4017
	lsr a
	rol.b PadRaw4
	lsr a
	rol.b PadRaw5
	lda.w $4017
	lsr a
	rol.b PadRaw4
	lsr a
	rol.b PadRaw5
	lda.w $4017
	lsr a
	rol.b PadRaw4
	lsr a
	rol.b PadRaw5
	lda.w $4017
	lsr a
	rol.b PadRaw4
	lsr a
	rol.b PadRaw5
	lda.w $4017
	lsr a
	rol.b PadRaw4
	lsr a
	rol.b PadRaw5
	lda.w $4017
	lsr a
	rol.b PadRaw4
	lsr a
	rol.b PadRaw5
	lda.w $4017
	lsr a
	rol.b PadRaw4
	lsr a
	rol.b PadRaw5
	lda.w $4017
	lsr a
	rol.b PadRaw4
	lsr a
	rol.b PadRaw5
	lda.b PadRaw4
	and.b #$0F
	sta.w mp5padsig+3
	lda.b PadRaw5
	and.b #$0F
	sta.w mp5padsig+4
	lda.w $4017
	lsr a
	rol.w mp5padsig+3
	lsr a
	rol.w mp5padsig+4
	bra .5
.4:									; A = $4017, A / 2
	lda.w $4017
	lsr a
	rol.w mp5padsig+1
.5:									; $4201 = $80, A = mp5warning, A and $01, mp5warning = A, ...
	lda.b #$80
	sta.w $4201
	lda.w mp5warning
	and.b #$01
	sta.w mp5warning
	lda.w mp5checktimer
	beq .6
	dec.w mp5checktimer
.6:									; JOYSER0 = 0, JOYSER0 = $01, A = JOYSER0, A and $02, ...
	stz.w JOYSER0
	lda.b #$01
	sta.w JOYSER0
	lda.w JOYSER0
	and.b #$02
	tax
	eor.w mp5port1last
	stx.w mp5port1last
	sta.w mp5portchg
	lda.w $4017
	and.b #$02
	tax
	eor.w mp5port2last
	stx.w mp5port2last
	ora.w mp5portchg
	beq .7
	lda.b #$10
	sta.w mp5checktimer
.7:									; if mp5checktimer is not 0 go to .8, go to .12
	lda.w mp5checktimer
	bne .8
	bra .12
.8:									; call Multi5ConnectCheck, PadRaw3 = $000F, PadRaw4 = X, PadRaw5 = X, ...
	jsl.l Multi5ConnectCheck
	ldx.w #$000F
	stx.b PadRaw3
	stx.b PadRaw4
	stx.b PadRaw5
	lda.w mp5connect
	and.b #$80
	beq .9
	lda.b #$01
	tsb.w mp5warning
	bra .10
.9:									; A = $01
	lda.b #$01
	trb.w mp5warning
.10:								; A = mp5connect, if the result = 0 go to .11, A = $01, go to .13
	lda.w mp5connect
	and.b #$40
	beq .11
	lda.b #$01
	tsb.w mp5present
	bra .13
.11:								; A = $01, go to .13
	lda.b #$01
	trb.w mp5present
	bra .13
.12:								; JOYSER0 = 0
	stz.w JOYSER0
.13:								; if mp5padsig = $01 go to .14, PadRaw1 = $000F, ...
	lda.w mp5padsig
	cmp.b #$01
	beq .14
	ldx.w #$000F
	stx.b PadRaw1
	ldx.w mp5present
	beq .14
.14:								; if mp5padsig+1 = $01 go to .15, PadRaw2 = $000F, ...
	lda.w mp5padsig+1
	cmp.b #$01
	beq .15
	ldx.w #$000F
	stx.b PadRaw2
	ldx.w mp5present
	beq .18
.15:								; if mp5present = 0 go to .18, if mp5padsig+2 = $01 go to .16, ...
	lda.w mp5present
	beq .18
	lda.w mp5padsig+2
	cmp.b #$01
	beq .16
	ldx.w #$000F
	stx.b PadRaw3
.16:								; if mp5padsig+3 = $01 go to .17, PadRaw4 = $000F
	lda.w mp5padsig+3
	cmp.b #$01
	beq .17
	ldx.w #$000F
	stx.b PadRaw4
.17:								; if mp5padsig+4 = $01 go to .18, PadRaw5 = $000F
	lda.w mp5padsig+4
	cmp.b #$01
	beq .18
	ldx.w #$000F
	stx.b PadRaw5
.18:								; if mp5warning = 0 go to .19, PadRaw1 = $0000, PadRaw2 = X, ...
	lda.w mp5warning
	beq .19
	ldx.w #$0000
	stx.b PadRaw1
	stx.b PadRaw2
	stx.b PadRaw3
	stx.b PadRaw4
	stx.b PadRaw5
.19:								; return
	plp
	rtl

Multi5ConnectCheck:					; from Multi5Init, Multi5Bios and other segments
	php
	sep #$30
	stz.w mp5connect
.loop:								; loop: A = $4212, if the result is not 0 go to .loop, JOYSER0 = 0, ...
	lda.w $4212
	and.b #$01
	bne .loop
	stz.w JOYSER0
	lda.b #$01
	sta.w JOYSER0
	ldx.b #$08
.loop2:								; loop: A = JOYSER0, A / 2, A / 2, A = $4017, ...
	lda.w JOYSER0
	lsr a
	lsr a
	rol.w Multi5Sig+1
	lda.w $4017
	lsr a
	lsr a
	rol.w Multi5Sig+3
	dex
	bne .loop2
	stz.w JOYSER0
	ldx.b #$08
.loop3:								; loop: A = JOYSER0, A / 2, A / 2, A = $4017, ...
	lda.w JOYSER0
	lsr a
	lsr a
	rol.w Multi5Sig
	lda.w $4017
	lsr a
	lsr a
	rol.w Multi5Sig+2
	dex
	bne .loop3
	lda.w Multi5Sig+1
	cmp.b #$FF
	bne .1
	lda.w Multi5Sig
	cmp.b #$FF
	beq .1
	lda.b #$00
	sta.w mp5connect
.1:									; if Multi5Sig+3 is not $FF go to .2, if Multi5Sig+2 = $FF go to .2, ...
	lda.w Multi5Sig+3
	cmp.b #$FF
	bne .2
	lda.w Multi5Sig+2
	cmp.b #$FF
	beq .2
	lda.b #$00
	sta.w mp5connect
.2:									; return
	plp
	rtl

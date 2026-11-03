ReadActiveMenuPad:					; select the first enabled pad with held buttons for the menu
	stz.w pausepad
	bit.w padside
	bmi .1
	lda.b PadRaw1
	and.w #$FFF0
	bne .6
.1:									; pausepad + 1, pausepad + 1, if minus go to .2, A = PadRaw2, ...
	inc.w pausepad
	inc.w pausepad
	bit.w padside+2
	bmi .2
	lda.b PadRaw2
	and.w #$FFF0
	bne .6
.2:									; pausepad + 1, pausepad + 1, if minus go to .3, A = PadRaw3, ...
	inc.w pausepad
	inc.w pausepad
	bit.w padside+4
	bmi .3
	lda.b PadRaw3
	and.w #$FFF0
	bne .6
.3:									; pausepad + 1, pausepad + 1, if minus go to .4, A = PadRaw4, ...
	inc.w pausepad
	inc.w pausepad
	bit.w padside+6
	bmi .4
	lda.b PadRaw4
	and.w #$FFF0
	bne .6
.4:									; pausepad + 1, pausepad + 1, if minus go to .5, A = PadRaw5, ...
	inc.w pausepad
	inc.w pausepad
	bit.w padside+8
	bmi .5
	lda.b PadRaw5
	and.w #$FFF0
	bne .6
.5:									; padchangeany = 0, padlast = 0, pausepad = $FFFF, return
	stz.w padchangeany
	stz.w padlast
	lda.w #$FFFF
	sta.w pausepad
	rtl
.6:									; padchangeany = A, repeatdelayframes + 1, if A = padlast go to .rtl, ...
	sta.w padchangeany
	inc.w repeatdelayframes
	cmp.w padlast
	beq .rtl
	stz.w repeatdelayframes
	sta.w padlast
.rtl:								; return
	rtl

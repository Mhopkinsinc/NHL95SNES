PlayerShortName:					; 94S's number, initial and surname of player d0 of team a2, reached only
									; from GetPlayerNumInitial (no caller); it expects 94S's records (a length
									; word, the name, the number)
	pei ($7F)
	pei ($81)
	pei ($6B)
	pei ($6D)
	pei ($63)
	pei ($65)
	jsl.l GetPlayerRecord
	stz.b a1+2
	lda.w #mesarea
	sta.b a1
	lda.w #$0002
	sta.b [a1]
	inc.b a1
	inc.b a1
	pei ($63)
	pei ($65)
	lda.b a0
	clc
	adc.b [a0]
	sta.b a0
	lda.b [a0]
	and.w #$00FF
	sta.b d0
	jsl.l ConvertByteToDigits
	lda.w #$0020
	sta.b [a1]
	inc.b a1
	pla
	sta.b a0+2
	pla
	sta.b a0
	lda.b [a0]
	sta.b d0
	clc
	adc.b a0
	sta.b a2
	lda.b a0+2
	sta.b a2+2
	inc.b a0
	inc.b a0
	lda.b [a0]
	inc.b a0
	sta.b [a1]
	inc.b a1
	lda.w #$002E
	sta.b [a1]
	inc.b a1
	lda.w #$0020
	sta.b [a1]
	inc.b a1
.loop:								; loop: A = [a0], a0 + 1, A and $00FF, if A is not $0020 go to .loop
	lda.b [a0]
	inc.b a0
	and.w #$00FF
	cmp.w #$0020
	bne .loop
.loop2:								; loop: A = [a0], a0 + 1, [a1] = A, a1 + 1, ...
	lda.b [a0]
	inc.b a0
	sta.b [a1]
	inc.b a1
	lda.b a0
	cmp.b a2
	bne .loop2
	pla
	sta.b a0+2
	pla
	sta.b a0
	pla
	sta.b a2+2
	pla
	sta.b a2
	pla
	sta.b d0+2
	pla
	sta.b d0
	rtl

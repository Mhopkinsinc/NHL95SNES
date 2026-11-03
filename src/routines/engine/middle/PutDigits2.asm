PutDigits2:							; from PlayerShortName and other segments
	lda.w #$2020
	sta.b tmp0
	lda.b d0
	and.w #$00FF
	cmp.w #$000A
	bcc .1
	lsr a
	lsr a
	lsr a
	lsr a
	clc
	adc.w #$0030
	sta.b tmp0
.1:									; A = d0, A and $000F, A + $0030, $A0 = A, ...
	lda.b d0
	and.w #$000F
	clc
	adc.w #$0030
	sta.b $A0
	lda.b tmp0
	sta.b [a1]
	inc.b a1
	inc.b a1
	rtl

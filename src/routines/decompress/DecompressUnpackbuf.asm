DecompressUnpackbuf:				; Decompress X:A into unpackbuf
	ldy.w #unpackbuf
	sty.b r0
	ldy.w #unpackbuf>>16
	sty.b r0+2
Decompress:							; unpack the set at X:A (size word, format word, stream) to [$2C]
	phb
	sta.b r1
	stx.b r1+2
	sep #$30
	lda.b #$54
	sta.b tmp0
	sta.b tmp2
	lda.b #$6B
	sta.b $A2
	sta.b $A6
	lda.b r0+2
	sta.b $A4
	sta.b tmp3
	sta.b $A0
	stx.b tmp1
	rep #$31
	lda.b r0
	sta.b $0C
	ldy.w #$0002
	lda.b [r1],y
	tax
	lda.b r1
	adc.w #$0003
	sta.b r1
	bcc .1
	inc.b r1+2
	clc
.1:									; jump through DecompressFormats,x
	jmp (DecompressFormats,x)

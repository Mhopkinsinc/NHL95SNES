RatingText:							; mesarea = the text of rating A as shown: A * 5 + 25
	sta.b tmp1
	asl a
	asl a
	adc.b tmp1
	adc.w #$0019
	jsr.w BinToBCD
	jmp.w BCDText

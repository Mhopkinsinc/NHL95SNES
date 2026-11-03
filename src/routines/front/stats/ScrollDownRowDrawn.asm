ScrollDownRowDrawn:					; ScrollListDown's new bottom row drawn: SendTextMap, then
									; ScrollListDownAnim
	jsl.l SendTextMap
	bra ScrollListDownAnim

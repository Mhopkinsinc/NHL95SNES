BracketWindowHDMA1:					; indirect HDMA table for WH0-WH3 (the two windows' edges): two runs of
									; 112 lines from ScratchBuf and ScratchBuf+$1C0
	db $F0,$4E,$36,$F0,$0E,$38,$00
BracketWindowHDMA2:					; the same for ScratchBuf+$380 and ScratchBuf+$540
	db $F0,$CE,$39,$F0
	db $8E,$3B,$00

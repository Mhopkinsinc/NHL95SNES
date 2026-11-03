Sample02:							; sound sample 2 of the sample list: header, then BRR blocks
	incbin "../../../Extracted/segments/bankC4_F000.bin":$2FC..$A58
	padbyte $00						; unused to the end of the bank
	pad $C50000

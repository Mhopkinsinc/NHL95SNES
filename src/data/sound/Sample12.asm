Sample12:							; sound sample 12 of the sample list: header, then BRR blocks
	incbin "../../../Extracted/segments/bankC2_F000.bin":$C60..$F4E
	padbyte $00						; unused to the end of the bank
	pad $C30000

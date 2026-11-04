Sample29:							; sound sample 29 of the sample list: header, then BRR blocks
	incbin "../../../Extracted/segments/bankC3_E000.bin":$82F..$1000
	incbin "../../../Extracted/segments/bankC3_F000.bin":$0..$E10	; the rest of Sample29
	padbyte $00						; unused to the end of the bank
	pad $C40000

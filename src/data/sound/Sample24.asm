Sample24:							; sound sample 24 of the sample list: header, then BRR blocks
	incbin "../../../Extracted/segments/bankC3_C000.bin":$DBF..$1000
	incbin "../../../Extracted/segments/bankC3_D000.bin":$0..$52D

Sample31:							; sound sample 31 of SampleList: header, then BRR blocks
	incbin "../../../Extracted/segments/bankCF_A000.bin":$AAD..$1000
; The rest of Sample31 (it starts in the previous segment).
	incbin "../../../Extracted/segments/bankCF_B000.bin":$0..$1000
	incbin "../../../Extracted/segments/bankCF_C000.bin":$0..$262

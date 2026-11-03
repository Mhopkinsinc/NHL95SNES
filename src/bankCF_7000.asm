; Segment bankCF_7000: sound data: the rest of sound 38 (Sequence38).
org $CF7000
; The data of sound 38 (Sequence38) continues from the previous segment.
	incbin "../Extracted/segments/bankCF_7000.bin":$0..$1000
	incbin "../Extracted/segments/bankCF_8000.bin":$0..$145

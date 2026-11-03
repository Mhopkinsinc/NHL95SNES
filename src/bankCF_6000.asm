; Segment bankCF_6000: sound data: sound 38 (Sequence38).
org $CF6A1A
Sequence38:							; sound 38 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $1729						; length of the data that follows
	incbin "../Extracted/segments/bankCF_6000.bin":$A1C..$1000

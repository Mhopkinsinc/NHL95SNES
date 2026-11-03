; Segment bankCF_5000: sound data: sound 35 (Sequence35), sound 37 (Sequence37).
org $CF5717
Sequence35:							; sound 35 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $01F2						; length of the data that follows
	incbin "../Extracted/segments/bankCF_5000.bin":$719..$90B
Sequence37:							; sound 37 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $110D						; length of the data that follows
	incbin "../Extracted/segments/bankCF_5000.bin":$90D..$1000
	incbin "../Extracted/segments/bankCF_6000.bin":$0..$A1A

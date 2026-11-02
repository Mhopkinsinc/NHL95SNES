; Segment bankCF_2000: sound data: sound 14 (Sequence14), sound 15 (Sequence15), ..., sound 22
; (Sequence22).
org $CF2123
Sequence14:							; sound 14 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $00FD						; length of the data that follows
	incbin "../Extracted/segments/bankCF_2000.bin":$125..$222
Sequence15:							; sound 15 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $021F						; length of the data that follows
	incbin "../Extracted/segments/bankCF_2000.bin":$224..$443
Sequence16:							; sound 16 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $0175						; length of the data that follows
	incbin "../Extracted/segments/bankCF_2000.bin":$445..$5BA
Sequence17:							; sound 17 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $0188						; length of the data that follows
	incbin "../Extracted/segments/bankCF_2000.bin":$5BC..$744
Sequence18:							; sound 18 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $00FE						; length of the data that follows
	incbin "../Extracted/segments/bankCF_2000.bin":$746..$844
Sequence19:							; sound 19 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $0224						; length of the data that follows
	incbin "../Extracted/segments/bankCF_2000.bin":$846..$A6A
Sequence20:							; sound 20 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $0289						; length of the data that follows
	incbin "../Extracted/segments/bankCF_2000.bin":$A6C..$CF5
Sequence21:							; sound 21 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $027E						; length of the data that follows
	incbin "../Extracted/segments/bankCF_2000.bin":$CF7..$F75
Sequence22:							; sound 22 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $0224						; length of the data that follows
	incbin "../Extracted/segments/bankCF_2000.bin":$F77..$1000
	incbin "../Extracted/segments/bankCF_3000.bin":$0..$19B

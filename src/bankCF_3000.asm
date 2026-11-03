; Segment bankCF_3000: sound data: sound 23 (Sequence23), sound 24 (Sequence24), ..., sound 29
; (Sequence29).
org $CF319B
Sequence23:							; sound 23 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $0240						; length of the data that follows
	incbin "../Extracted/segments/bankCF_3000.bin":$19D..$3DD
Sequence24:							; sound 24 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $0240						; length of the data that follows
	incbin "../Extracted/segments/bankCF_3000.bin":$3DF..$61F
Sequence25:							; sound 25 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $01CD						; length of the data that follows
	incbin "../Extracted/segments/bankCF_3000.bin":$621..$7EE
Sequence26:							; sound 26 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $02C7						; length of the data that follows
	incbin "../Extracted/segments/bankCF_3000.bin":$7F0..$AB7
Sequence27:							; sound 27 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $02E4						; length of the data that follows
	incbin "../Extracted/segments/bankCF_3000.bin":$AB9..$D9D
Sequence28:							; sound 28 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $01DA						; length of the data that follows
	incbin "../Extracted/segments/bankCF_3000.bin":$D9F..$F79
Sequence29:							; sound 29 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $0191						; length of the data that follows
	incbin "../Extracted/segments/bankCF_3000.bin":$F7B..$1000
	incbin "../Extracted/segments/bankCF_4000.bin":$0..$10C

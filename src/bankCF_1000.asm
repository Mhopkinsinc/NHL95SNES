; Segment bankCF_1000: sound data: sound 5 (Sequence05), sound 6 (Sequence06), ..., sound 13
; (Sequence13).
org $CF1099
Sequence05:							; sound 5 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $01E9						; length of the data that follows
	incbin "../Extracted/segments/bankCF_1000.bin":$9B..$284
Sequence06:							; sound 6 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $01CE						; length of the data that follows
	incbin "../Extracted/segments/bankCF_1000.bin":$286..$454
Sequence07:							; sound 7 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $012C						; length of the data that follows
	incbin "../Extracted/segments/bankCF_1000.bin":$456..$582
Sequence08:							; sound 8 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $0194						; length of the data that follows
	incbin "../Extracted/segments/bankCF_1000.bin":$584..$718
Sequence09:							; sound 9 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $02A6						; length of the data that follows
	incbin "../Extracted/segments/bankCF_1000.bin":$71A..$9C0
Sequence10:							; sound 10 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $01FD						; length of the data that follows
	incbin "../Extracted/segments/bankCF_1000.bin":$9C2..$BBF
Sequence11:							; sound 11 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $0177						; length of the data that follows
	incbin "../Extracted/segments/bankCF_1000.bin":$BC1..$D38
Sequence12:							; sound 12 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $01C1						; length of the data that follows
	incbin "../Extracted/segments/bankCF_1000.bin":$D3A..$EFB
Sequence13:							; sound 13 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $0226						; length of the data that follows
	incbin "../Extracted/segments/bankCF_1000.bin":$EFD..$1000
	incbin "../Extracted/segments/bankCF_2000.bin":$0..$123

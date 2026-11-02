; Segment bankCF_4000: sound data: sound 30 (Sequence30), sound 31 (Sequence31), ..., sound 36
; (Sequence36).
org $CF410C
Sequence30:							; sound 30 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $00B0						; length of the data that follows
	incbin "../Extracted/segments/bankCF_4000.bin":$10E..$1BE
Sequence31:							; sound 31 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $0191						; length of the data that follows
	incbin "../Extracted/segments/bankCF_4000.bin":$1C0..$351
Sequence32:							; sound 32 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $00AF						; length of the data that follows
	incbin "../Extracted/segments/bankCF_4000.bin":$353..$402
Sequence33:							; sound 33 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $02CA						; length of the data that follows
	incbin "../Extracted/segments/bankCF_4000.bin":$404..$6CE
Sequence36:							; sound 36 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $1047						; length of the data that follows
	incbin "../Extracted/segments/bankCF_4000.bin":$6D0..$1000
	incbin "../Extracted/segments/bankCF_5000.bin":$0..$717

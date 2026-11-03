Sequence01:							; sound 1 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $02CE						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_0000.bin":$67B..$949
Sequence02:							; sound 2 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $01B0						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_0000.bin":$94B..$AFB
Sequence03:							; sound 3 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $01DF						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_0000.bin":$AFD..$CDC
Sequence00:							; sound 0 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $0168						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_0000.bin":$CDE..$E46
Sequence04:							; sound 4 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $0251						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_0000.bin":$E48..$1000
	incbin "../../../Extracted/segments/bankCF_1000.bin":$0..$99
Sequence05:							; sound 5 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $01E9						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_1000.bin":$9B..$284
Sequence06:							; sound 6 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $01CE						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_1000.bin":$286..$454
Sequence07:							; sound 7 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $012C						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_1000.bin":$456..$582
Sequence08:							; sound 8 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $0194						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_1000.bin":$584..$718
Sequence09:							; sound 9 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $02A6						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_1000.bin":$71A..$9C0
Sequence10:							; sound 10 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $01FD						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_1000.bin":$9C2..$BBF
Sequence11:							; sound 11 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $0177						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_1000.bin":$BC1..$D38
Sequence12:							; sound 12 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $01C1						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_1000.bin":$D3A..$EFB
Sequence13:							; sound 13 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $0226						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_1000.bin":$EFD..$1000
	incbin "../../../Extracted/segments/bankCF_2000.bin":$0..$123
Sequence14:							; sound 14 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $00FD						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_2000.bin":$125..$222
Sequence15:							; sound 15 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $021F						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_2000.bin":$224..$443
Sequence16:							; sound 16 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $0175						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_2000.bin":$445..$5BA
Sequence17:							; sound 17 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $0188						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_2000.bin":$5BC..$744
Sequence18:							; sound 18 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $00FE						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_2000.bin":$746..$844
Sequence19:							; sound 19 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $0224						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_2000.bin":$846..$A6A
Sequence20:							; sound 20 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $0289						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_2000.bin":$A6C..$CF5
Sequence21:							; sound 21 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $027E						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_2000.bin":$CF7..$F75
Sequence22:							; sound 22 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $0224						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_2000.bin":$F77..$1000
	incbin "../../../Extracted/segments/bankCF_3000.bin":$0..$19B
Sequence23:							; sound 23 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $0240						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_3000.bin":$19D..$3DD
Sequence24:							; sound 24 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $0240						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_3000.bin":$3DF..$61F
Sequence25:							; sound 25 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $01CD						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_3000.bin":$621..$7EE
Sequence26:							; sound 26 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $02C7						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_3000.bin":$7F0..$AB7
Sequence27:							; sound 27 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $02E4						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_3000.bin":$AB9..$D9D
Sequence28:							; sound 28 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $01DA						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_3000.bin":$D9F..$F79
Sequence29:							; sound 29 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $0191						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_3000.bin":$F7B..$1000
	incbin "../../../Extracted/segments/bankCF_4000.bin":$0..$10C
Sequence30:							; sound 30 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $00B0						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_4000.bin":$10E..$1BE
Sequence31:							; sound 31 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $0191						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_4000.bin":$1C0..$351
Sequence32:							; sound 32 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $00AF						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_4000.bin":$353..$402
Sequence33:							; sound 33 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $02CA						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_4000.bin":$404..$6CE
Sequence36:							; sound 36 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $1047						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_4000.bin":$6D0..$1000
	incbin "../../../Extracted/segments/bankCF_5000.bin":$0..$717
Sequence35:							; sound 35 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $01F2						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_5000.bin":$719..$90B
Sequence37:							; sound 37 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $110D						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_5000.bin":$90D..$1000
	incbin "../../../Extracted/segments/bankCF_6000.bin":$0..$A1A
Sequence38:							; sound 38 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $1729						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_6000.bin":$A1C..$1000
; The data of sound 38 (Sequence38) continues from the previous segment.
	incbin "../../../Extracted/segments/bankCF_7000.bin":$0..$1000
	incbin "../../../Extracted/segments/bankCF_8000.bin":$0..$145
Sequence39:							; sound 39 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $145D						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_8000.bin":$147..$1000
	incbin "../../../Extracted/segments/bankCF_9000.bin":$0..$5A4

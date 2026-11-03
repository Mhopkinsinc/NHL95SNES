Sequence34:							; sound 34 of SoundSequenceTable: a length word, then its data;
									; LoadSequence sends the samples it lists from +3 (a count, then the
									; sample numbers)
	dw $02FD						; length of the data that follows
	incbin "../../../Extracted/segments/bankCF_C000.bin":$264..$561

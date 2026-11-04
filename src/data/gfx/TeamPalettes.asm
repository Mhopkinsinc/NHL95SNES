TeamPalettes:						; one 16 colour palette per team in team order (the all-star teams last):
									; two shade ramps in the team colours and a gold; unpacked to RAM, from
									; where the palettes of two team numbers go to CGRAM
	dw $0380						; unpacked size in bytes
	dw $0002						; format 2: literal runs and copies from up to 10 bits back
	incbin "../../../Extracted/segments/bankC0_0000.bin":4..$27E

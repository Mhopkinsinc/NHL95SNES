SpriteField4DataUnused:				; the word $04E2 again and again: sprite record field +4 points into it,
									; but the code loads that field and drops it
	incbin "../../../Extracted/segments/bankC1_0000.bin":$4E0..$533

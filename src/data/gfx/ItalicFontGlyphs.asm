ItalicFontGlyphs:					; 16 x 16 glyphs, italic and shaded: 0-9, punctuation, A-Z, then again for
									; the lowercase codes (the last under ThinFontGlyphs); for setup options,
									; name entry and season team stats
	incbin "../../../Extracted/segments/bankC0_1000.bin":$FF9..$1000
	incbin "../../../Extracted/segments/bankC0_2000.bin"
	incbin "../../../Extracted/segments/bankC0_3000.bin":0..$239

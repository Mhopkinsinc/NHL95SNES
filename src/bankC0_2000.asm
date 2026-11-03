; Segment bankC0_2000: three fonts for the text routine, which draws strings glyph by glyph into a buffer.
; Glyph rows are 2bpp (two bytes: planes 0 and 1); the right half of a 16 pixel row is 16 bytes on. The glyph
; number is the character code minus '0'.
org $C01A39
BoldFontGlyphs:						; bold text glyphs for bracket and award headings, stats values and roster
									; lists; rendered per string by DrawText
	incbin "../Extracted/segments/bankC0_1000.bin":$A39..$FF9
ItalicFontGlyphs:					; italic text glyphs for setup options, name entry and season team stats;
									; lowercase uses a second set overlapping ThinFontGlyphs
	incbin "../Extracted/segments/bankC0_1000.bin":$FF9..$1000
	incbin "../Extracted/segments/bankC0_2000.bin"
	incbin "../Extracted/segments/bankC0_3000.bin":0..$239
ThinFontGlyphs:						; thin text glyphs for team labels on stats, scouting, award and Games
									; Today
									; screens; rendered per string by DrawText
	incbin "../Extracted/segments/bankC0_3000.bin":$239..$CF9

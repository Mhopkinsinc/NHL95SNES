GlyphPixelRoutines:					; per pixel column of the glyph's left edge ($0A & 7, * 2): the
									; DrawGlyphPixel routine DrawGlyphRow runs (address - 1: pushed, then rts)
	dw DrawGlyphPixel0-1,DrawGlyphPixel1-1,DrawGlyphPixel2-1,DrawGlyphPixel3-1
	dw DrawGlyphPixel4-1,DrawGlyphPixel5-1,DrawGlyphPixel6-1,DrawGlyphPixel7-1

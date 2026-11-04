FrameTiles0ED:						; the raw tiles of frame $0ED (FrameTileSource / FrameBankLayout entry
									; $0ED); pose not traced
	incbin "../../../Extracted/segments/bankC7_C000.bin":$F5E..$1000
	incbin "../../../Extracted/segments/bankC7_D000.bin":$0..$1DE

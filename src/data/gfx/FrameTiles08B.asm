FrameTiles08B:						; the raw tiles of frame $08B (FrameTileSource / FrameBankLayout entry
									; $08B); pose not traced
	incbin "../../../Extracted/segments/bankC6_D000.bin":$F68..$1000
	incbin "../../../Extracted/segments/bankC6_E000.bin":$0..$1E8

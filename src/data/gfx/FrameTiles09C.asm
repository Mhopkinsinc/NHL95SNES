FrameTiles09C:						; the raw tiles of frame $09C (FrameTileSource / FrameBankLayout entry
									; $09C); pose not traced
	incbin "../../../Extracted/segments/bankC7_0000.bin":$EBE..$1000
	incbin "../../../Extracted/segments/bankC7_1000.bin":$0..$BE

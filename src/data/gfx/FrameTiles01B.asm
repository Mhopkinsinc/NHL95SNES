FrameTiles01B:						; the raw tiles of frame $01B (FrameTileSource / FrameBankLayout entry
									; $01B); pose not traced
	incbin "../../../Extracted/segments/bankC6_4000.bin":$EC8..$1000
	incbin "../../../Extracted/segments/bankC6_5000.bin":$0..$C8

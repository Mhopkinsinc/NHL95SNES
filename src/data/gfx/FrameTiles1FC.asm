FrameTiles1FC:						; the raw tiles of frame $1FC (FrameTileSource / FrameBankLayout entry
									; $1FC); pose not traced
	incbin "../../../Extracted/segments/bankC9_5000.bin":$FAB..$1000
	incbin "../../../Extracted/segments/bankC9_6000.bin":$0..$20B

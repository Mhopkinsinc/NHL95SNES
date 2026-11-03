FrameTiles1EC:						; the raw tiles of frame $1EC (FrameTileSource / FrameBankLayout entry
									; $1EC); pose not traced
	incbin "../../../Extracted/segments/bankC9_3000.bin":$DEB..$1000
	incbin "../../../Extracted/segments/bankC9_4000.bin":$0..$4B

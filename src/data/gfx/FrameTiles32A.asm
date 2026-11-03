FrameTiles32A:						; the raw tiles of frame $32A (FrameTileSource / FrameBankLayout entry
									; $32A); pose not traced
	incbin "../../../Extracted/segments/bankCB_4000.bin":$DB5..$1000
	incbin "../../../Extracted/segments/bankCB_5000.bin":$0..$15

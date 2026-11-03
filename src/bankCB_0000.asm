; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $CB08B5
FrameTiles2D6:						; the raw tiles of frame $2D6 (FrameTileSource / FrameBankLayout entry
									; $2D6); pose not traced
	incbin "../Extracted/segments/bankCB_0000.bin":$8B5..$B15
FrameTiles2D7:						; the raw tiles of frame $2D7 (FrameTileSource / FrameBankLayout entry
									; $2D7); pose not traced
	incbin "../Extracted/segments/bankCB_0000.bin":$B15..$D15
FrameTiles2D8:						; the raw tiles of frame $2D8 (FrameTileSource / FrameBankLayout entry
									; $2D8); pose not traced
	incbin "../Extracted/segments/bankCB_0000.bin":$D15..$F75
FrameTiles2D9:						; the raw tiles of frame $2D9 (FrameTileSource / FrameBankLayout entry
									; $2D9); pose not traced
	incbin "../Extracted/segments/bankCB_0000.bin":$F75..$1000
	incbin "../Extracted/segments/bankCB_1000.bin":$0..$175

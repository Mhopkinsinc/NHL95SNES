; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $C9076B
FrameTiles1D5:						; the raw tiles of frame $1D5 (FrameTileSource / FrameBankLayout entry
									; $1D5); pose not traced
	incbin "../Extracted/segments/bankC9_0000.bin":$76B..$96B
FrameTiles1D6:						; the raw tiles of frame $1D6 (FrameTileSource / FrameBankLayout entry
									; $1D6); pose not traced
	incbin "../Extracted/segments/bankC9_0000.bin":$96B..$BCB
FrameTiles1D7:						; the raw tiles of frame $1D7 (FrameTileSource / FrameBankLayout entry
									; $1D7); pose not traced
	incbin "../Extracted/segments/bankC9_0000.bin":$BCB..$E4B
FrameTiles1D8:						; the raw tiles of frame $1D8 (FrameTileSource / FrameBankLayout entry
									; $1D8); pose not traced
	incbin "../Extracted/segments/bankC9_0000.bin":$E4B..$1000
	incbin "../Extracted/segments/bankC9_1000.bin":$0..$CB

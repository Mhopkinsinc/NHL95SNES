; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $CCC1E5
FrameTiles3F1:						; the raw tiles of frame $3F1 (FrameTileSource / FrameBankLayout entry
									; $3F1); pose not traced
	incbin "../Extracted/segments/bankCC_C000.bin":$1E5..$445
FrameTiles3F2:						; the raw tiles of frame $3F2 (FrameTileSource / FrameBankLayout entry
									; $3F2); pose not traced
	incbin "../Extracted/segments/bankCC_C000.bin":$445..$6A5
FrameTiles3F3:						; the raw tiles of frame $3F3 (FrameTileSource / FrameBankLayout entry
									; $3F3); pose not traced
	incbin "../Extracted/segments/bankCC_C000.bin":$6A5..$905
FrameTiles3F4:						; the raw tiles of frame $3F4 (FrameTileSource / FrameBankLayout entry
									; $3F4); pose not traced
	incbin "../Extracted/segments/bankCC_C000.bin":$905..$B65
FrameTiles3F5:						; the raw tiles of frame $3F5 (FrameTileSource / FrameBankLayout entry
									; $3F5); pose not traced
	incbin "../Extracted/segments/bankCC_C000.bin":$B65..$DE5
FrameTiles3F6:						; the raw tiles of frame $3F6 (FrameTileSource / FrameBankLayout entry
									; $3F6); pose not traced
	incbin "../Extracted/segments/bankCC_C000.bin":$DE5..$FE5
FrameTiles3F7:						; the raw tiles of frame $3F7 (FrameTileSource / FrameBankLayout entry
									; $3F7); pose not traced
	incbin "../Extracted/segments/bankCC_C000.bin":$FE5..$1000
	incbin "../Extracted/segments/bankCC_D000.bin":$0..$265

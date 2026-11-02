; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $CCB125
FrameTiles3C9:						; the raw tiles of frame $3C9 (FrameTileSource / FrameBankLayout entry
									; $3C9); pose not traced
	incbin "../Extracted/segments/bankCC_B000.bin":$125..$325
FrameTiles3CA:						; the raw tiles of frame $3CA (FrameTileSource / FrameBankLayout entry
									; $3CA); pose not traced
	incbin "../Extracted/segments/bankCC_B000.bin":$325..$525
FrameTiles3CB:						; the raw tiles of frame $3CB (FrameTileSource / FrameBankLayout entry
									; $3CB); pose not traced
	incbin "../Extracted/segments/bankCC_B000.bin":$525..$725
FrameTiles3EC:						; the raw tiles of frame $3EC (FrameTileSource / FrameBankLayout entry
									; $3EC); pose not traced
	incbin "../Extracted/segments/bankCC_B000.bin":$725..$925
FrameTiles3ED:						; the raw tiles of frame $3ED (FrameTileSource / FrameBankLayout entry
									; $3ED); pose not traced
	incbin "../Extracted/segments/bankCC_B000.bin":$925..$B85
FrameTiles3EE:						; the raw tiles of frame $3EE (FrameTileSource / FrameBankLayout entry
									; $3EE); pose not traced
	incbin "../Extracted/segments/bankCC_B000.bin":$B85..$D85
FrameTiles3EF:						; the raw tiles of frame $3EF (FrameTileSource / FrameBankLayout entry
									; $3EF); pose not traced
	incbin "../Extracted/segments/bankCC_B000.bin":$D85..$FE5
FrameTiles3F0:						; the raw tiles of frame $3F0 (FrameTileSource / FrameBankLayout entry
									; $3F0); pose not traced
	incbin "../Extracted/segments/bankCC_B000.bin":$FE5..$1000
	incbin "../Extracted/segments/bankCC_C000.bin":$0..$1E5

; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $CCA125
FrameTiles3C1:						; the raw tiles of frame $3C1 (FrameTileSource / FrameBankLayout entry
									; $3C1); pose not traced
	incbin "../Extracted/segments/bankCC_A000.bin":$125..$325
FrameTiles3C2:						; the raw tiles of frame $3C2 (FrameTileSource / FrameBankLayout entry
									; $3C2); pose not traced
	incbin "../Extracted/segments/bankCC_A000.bin":$325..$525
FrameTiles3C3:						; the raw tiles of frame $3C3 (FrameTileSource / FrameBankLayout entry
									; $3C3); pose not traced
	incbin "../Extracted/segments/bankCC_A000.bin":$525..$725
FrameTiles3C4:						; the raw tiles of frame $3C4 (FrameTileSource / FrameBankLayout entry
									; $3C4); pose not traced
	incbin "../Extracted/segments/bankCC_A000.bin":$725..$925
FrameTiles3C5:						; the raw tiles of frame $3C5 (FrameTileSource / FrameBankLayout entry
									; $3C5); pose not traced
	incbin "../Extracted/segments/bankCC_A000.bin":$925..$B25
FrameTiles3C6:						; the raw tiles of frame $3C6 (FrameTileSource / FrameBankLayout entry
									; $3C6); pose not traced
	incbin "../Extracted/segments/bankCC_A000.bin":$B25..$D25
FrameTiles3C7:						; the raw tiles of frame $3C7 (FrameTileSource / FrameBankLayout entry
									; $3C7); pose not traced
	incbin "../Extracted/segments/bankCC_A000.bin":$D25..$F25
FrameTiles3C8:						; the raw tiles of frame $3C8 (FrameTileSource / FrameBankLayout entry
									; $3C8); pose not traced
	incbin "../Extracted/segments/bankCC_A000.bin":$F25..$1000
	incbin "../Extracted/segments/bankCC_B000.bin":$0..$125

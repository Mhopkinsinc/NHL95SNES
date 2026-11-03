; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $CC90A5
FrameTiles3B9:						; the raw tiles of frame $3B9 (FrameTileSource / FrameBankLayout entry
									; $3B9); pose not traced
	incbin "../Extracted/segments/bankCC_9000.bin":$A5..$325
FrameTiles3BA:						; the raw tiles of frame $3BA (FrameTileSource / FrameBankLayout entry
									; $3BA); pose not traced
	incbin "../Extracted/segments/bankCC_9000.bin":$325..$525
FrameTiles3BB:						; the raw tiles of frame $3BB (FrameTileSource / FrameBankLayout entry
									; $3BB); pose not traced
	incbin "../Extracted/segments/bankCC_9000.bin":$525..$725
FrameTiles3BC:						; the raw tiles of frame $3BC (FrameTileSource / FrameBankLayout entry
									; $3BC); pose not traced
	incbin "../Extracted/segments/bankCC_9000.bin":$725..$925
FrameTiles3BD:						; the raw tiles of frame $3BD (FrameTileSource / FrameBankLayout entry
									; $3BD); pose not traced
	incbin "../Extracted/segments/bankCC_9000.bin":$925..$B25
FrameTiles3BE:						; the raw tiles of frame $3BE (FrameTileSource / FrameBankLayout entry
									; $3BE); pose not traced
	incbin "../Extracted/segments/bankCC_9000.bin":$B25..$D25
FrameTiles3BF:						; the raw tiles of frame $3BF (FrameTileSource / FrameBankLayout entry
									; $3BF); pose not traced
	incbin "../Extracted/segments/bankCC_9000.bin":$D25..$F25
FrameTiles3C0:						; the raw tiles of frame $3C0 (FrameTileSource / FrameBankLayout entry
									; $3C0); pose not traced
	incbin "../Extracted/segments/bankCC_9000.bin":$F25..$1000
	incbin "../Extracted/segments/bankCC_A000.bin":$0..$125

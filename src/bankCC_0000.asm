; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $CC05E5
FrameTiles37B:						; the raw tiles of frame $37B (FrameTileSource / FrameBankLayout entry
									; $37B); pose not traced
	incbin "../Extracted/segments/bankCC_0000.bin":$5E5..$845
FrameTiles37C:						; the raw tiles of frame $37C (FrameTileSource / FrameBankLayout entry
									; $37C); pose not traced
	incbin "../Extracted/segments/bankCC_0000.bin":$845..$A45
FrameTiles37D:						; the raw tiles of frame $37D (FrameTileSource / FrameBankLayout entry
									; $37D); pose not traced
	incbin "../Extracted/segments/bankCC_0000.bin":$A45..$CA5
FrameTiles37E:						; the raw tiles of frame $37E (FrameTileSource / FrameBankLayout entry
									; $37E); pose not traced
	incbin "../Extracted/segments/bankCC_0000.bin":$CA5..$F25
FrameTiles37F:						; the raw tiles of frame $37F (FrameTileSource / FrameBankLayout entry
									; $37F); pose not traced
	incbin "../Extracted/segments/bankCC_0000.bin":$F25..$1000
	incbin "../Extracted/segments/bankCC_1000.bin":$0..$1A5

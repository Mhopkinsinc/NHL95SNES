; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $CC51E5
FrameTiles39D:						; the raw tiles of frame $39D (FrameTileSource / FrameBankLayout entry
									; $39D); pose not traced
	incbin "../Extracted/segments/bankCC_5000.bin":$1E5..$445
FrameTiles39E:						; the raw tiles of frame $39E (FrameTileSource / FrameBankLayout entry
									; $39E); pose not traced
	incbin "../Extracted/segments/bankCC_5000.bin":$445..$6C5
FrameTiles39F:						; the raw tiles of frame $39F (FrameTileSource / FrameBankLayout entry
									; $39F); pose not traced
	incbin "../Extracted/segments/bankCC_5000.bin":$6C5..$8C5
FrameTiles3A0:						; the raw tiles of frame $3A0 (FrameTileSource / FrameBankLayout entry
									; $3A0); pose not traced
	incbin "../Extracted/segments/bankCC_5000.bin":$8C5..$AC5
FrameTiles3A1:						; the raw tiles of frame $3A1 (FrameTileSource / FrameBankLayout entry
									; $3A1); pose not traced
	incbin "../Extracted/segments/bankCC_5000.bin":$AC5..$CC5
FrameTiles3A2:						; the raw tiles of frame $3A2 (FrameTileSource / FrameBankLayout entry
									; $3A2); pose not traced
	incbin "../Extracted/segments/bankCC_5000.bin":$CC5..$F25
FrameTiles3A3:						; the raw tiles of frame $3A3 (FrameTileSource / FrameBankLayout entry
									; $3A3); pose not traced
	incbin "../Extracted/segments/bankCC_5000.bin":$F25..$1000
	incbin "../Extracted/segments/bankCC_6000.bin":$0..$1A5

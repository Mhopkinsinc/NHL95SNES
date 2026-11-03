; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $C9216B
FrameTiles1E0:						; the raw tiles of frame $1E0 (FrameTileSource / FrameBankLayout entry
									; $1E0); pose not traced
	incbin "../Extracted/segments/bankC9_2000.bin":$16B..$3CB
FrameTiles1E1:						; the raw tiles of frame $1E1 (FrameTileSource / FrameBankLayout entry
									; $1E1); pose not traced
	incbin "../Extracted/segments/bankC9_2000.bin":$3CB..$62B
FrameTiles1E2:						; the raw tiles of frame $1E2 (FrameTileSource / FrameBankLayout entry
									; $1E2); pose not traced
	incbin "../Extracted/segments/bankC9_2000.bin":$62B..$8AB
FrameTiles1E3:						; the raw tiles of frame $1E3 (FrameTileSource / FrameBankLayout entry
									; $1E3); pose not traced
	incbin "../Extracted/segments/bankC9_2000.bin":$8AB..$B2B
FrameTiles1E4:						; the raw tiles of frame $1E4 (FrameTileSource / FrameBankLayout entry
									; $1E4); pose not traced
	incbin "../Extracted/segments/bankC9_2000.bin":$B2B..$DAB
FrameTiles1E5:						; the raw tiles of frame $1E5 (FrameTileSource / FrameBankLayout entry
									; $1E5); pose not traced
	incbin "../Extracted/segments/bankC9_2000.bin":$DAB..$1000
	incbin "../Extracted/segments/bankC9_3000.bin":$0..$2B

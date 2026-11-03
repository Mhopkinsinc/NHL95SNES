; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $C9404B
FrameTiles1ED:						; the raw tiles of frame $1ED (FrameTileSource / FrameBankLayout entry
									; $1ED); pose not traced
	incbin "../Extracted/segments/bankC9_4000.bin":$4B..$2AB
FrameTiles1EE:						; the raw tiles of frame $1EE (FrameTileSource / FrameBankLayout entry
									; $1EE); pose not traced
	incbin "../Extracted/segments/bankC9_4000.bin":$2AB..$52B
FrameTiles1EF:						; the raw tiles of frame $1EF (FrameTileSource / FrameBankLayout entry
									; $1EF); pose not traced
	incbin "../Extracted/segments/bankC9_4000.bin":$52B..$7AB
FrameTiles1F0:						; the raw tiles of frame $1F0 (FrameTileSource / FrameBankLayout entry
									; $1F0); pose not traced
	incbin "../Extracted/segments/bankC9_4000.bin":$7AB..$9AB
FrameTiles1F1:						; the raw tiles of frame $1F1 (FrameTileSource / FrameBankLayout entry
									; $1F1); pose not traced
	incbin "../Extracted/segments/bankC9_4000.bin":$9AB..$BAB
FrameTiles1F2:						; the raw tiles of frame $1F2 (FrameTileSource / FrameBankLayout entry
									; $1F2); pose not traced
	incbin "../Extracted/segments/bankC9_4000.bin":$BAB..$DAB
FrameTiles1F3:						; the raw tiles of frame $1F3 (FrameTileSource / FrameBankLayout entry
									; $1F3); pose not traced
	incbin "../Extracted/segments/bankC9_4000.bin":$DAB..$FAB
FrameTiles1F4:						; the raw tiles of frame $1F4 (FrameTileSource / FrameBankLayout entry
									; $1F4); pose not traced
	incbin "../Extracted/segments/bankC9_4000.bin":$FAB..$1000
	incbin "../Extracted/segments/bankC9_5000.bin":$0..$1AB

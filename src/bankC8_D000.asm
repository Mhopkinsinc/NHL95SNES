; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $C8D199
FrameTiles1C2:						; the raw tiles of frame $1C2 (FrameTileSource / FrameBankLayout entry
									; $1C2); pose not traced
	incbin "../Extracted/segments/bankC8_D000.bin":$199..$419
FrameTiles1C3:						; the raw tiles of frame $1C3 (FrameTileSource / FrameBankLayout entry
									; $1C3); pose not traced
	incbin "../Extracted/segments/bankC8_D000.bin":$419..$699
FrameTiles1C4:						; the raw tiles of frame $1C4 (FrameTileSource / FrameBankLayout entry
									; $1C4); pose not traced
	incbin "../Extracted/segments/bankC8_D000.bin":$699..$8B9
FrameTiles1C5:						; the raw tiles of frame $1C5 (FrameTileSource / FrameBankLayout entry
									; $1C5); pose not traced
	incbin "../Extracted/segments/bankC8_D000.bin":$8B9..$AD9
FrameTiles1C6:						; the raw tiles of frame $1C6 (FrameTileSource / FrameBankLayout entry
									; $1C6); pose not traced
	incbin "../Extracted/segments/bankC8_D000.bin":$AD9..$CD9
FrameTiles1C7:						; the raw tiles of frame $1C7 (FrameTileSource / FrameBankLayout entry
									; $1C7); pose not traced
	incbin "../Extracted/segments/bankC8_D000.bin":$CD9..$ED9
FrameTiles1C8:						; the raw tiles of frame $1C8 (FrameTileSource / FrameBankLayout entry
									; $1C8); pose not traced
	incbin "../Extracted/segments/bankC8_D000.bin":$ED9..$1000
	incbin "../Extracted/segments/bankC8_E000.bin":$0..$139

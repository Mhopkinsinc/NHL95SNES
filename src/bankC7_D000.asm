; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $C7D1DE
FrameTiles0EE:						; the raw tiles of frame $0EE (FrameTileSource / FrameBankLayout entry
									; $0EE); pose not traced
	incbin "../Extracted/segments/bankC7_D000.bin":$1DE..$45E
FrameTiles0EF:						; the raw tiles of frame $0EF (FrameTileSource / FrameBankLayout entry
									; $0EF); pose not traced
	incbin "../Extracted/segments/bankC7_D000.bin":$45E..$6BE
FrameTiles0F0:						; the raw tiles of frame $0F0 (FrameTileSource / FrameBankLayout entry
									; $0F0); pose not traced
	incbin "../Extracted/segments/bankC7_D000.bin":$6BE..$93E
FrameTiles0F1:						; the raw tiles of frame $0F1 (FrameTileSource / FrameBankLayout entry
									; $0F1); pose not traced
	incbin "../Extracted/segments/bankC7_D000.bin":$93E..$BBE
FrameTiles0F2:						; the raw tiles of frame $0F2 (FrameTileSource / FrameBankLayout entry
									; $0F2); pose not traced
	incbin "../Extracted/segments/bankC7_D000.bin":$BBE..$E3E
FrameTiles0F3:						; the raw tiles of frame $0F3 (FrameTileSource / FrameBankLayout entry
									; $0F3); pose not traced
	incbin "../Extracted/segments/bankC7_D000.bin":$E3E..$1000
	incbin "../Extracted/segments/bankC7_E000.bin":$0..$BE

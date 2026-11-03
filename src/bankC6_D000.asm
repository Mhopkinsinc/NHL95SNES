; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $C6D0E8
FrameTiles084:						; the raw tiles of frame $084 (FrameTileSource / FrameBankLayout entry
									; $084); pose not traced
	incbin "../Extracted/segments/bankC6_D000.bin":$E8..$368
FrameTiles085:						; the raw tiles of frame $085 (FrameTileSource / FrameBankLayout entry
									; $085); pose not traced
	incbin "../Extracted/segments/bankC6_D000.bin":$368..$568
FrameTiles086:						; the raw tiles of frame $086 (FrameTileSource / FrameBankLayout entry
									; $086); pose not traced
	incbin "../Extracted/segments/bankC6_D000.bin":$568..$768
FrameTiles087:						; the raw tiles of frame $087 (FrameTileSource / FrameBankLayout entry
									; $087); pose not traced
	incbin "../Extracted/segments/bankC6_D000.bin":$768..$968
FrameTiles088:						; the raw tiles of frame $088 (FrameTileSource / FrameBankLayout entry
									; $088); pose not traced
	incbin "../Extracted/segments/bankC6_D000.bin":$968..$B68
FrameTiles089:						; the raw tiles of frame $089 (FrameTileSource / FrameBankLayout entry
									; $089); pose not traced
	incbin "../Extracted/segments/bankC6_D000.bin":$B68..$D68
FrameTiles08A:						; the raw tiles of frame $08A (FrameTileSource / FrameBankLayout entry
									; $08A); pose not traced
	incbin "../Extracted/segments/bankC6_D000.bin":$D68..$F68
FrameTiles08B:						; the raw tiles of frame $08B (FrameTileSource / FrameBankLayout entry
									; $08B); pose not traced
	incbin "../Extracted/segments/bankC6_D000.bin":$F68..$1000
	incbin "../Extracted/segments/bankC6_E000.bin":$0..$1E8

; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $C8A0F9
FrameTiles172:						; the raw tiles of frame $172 (FrameTileSource / FrameBankLayout entry
									; $172); pose not traced
	incbin "../Extracted/segments/bankC8_A000.bin":$F9..$359
FrameTiles174:						; the raw tiles of frame $174 (FrameTileSource / FrameBankLayout entry
									; $174); pose not traced
	incbin "../Extracted/segments/bankC8_A000.bin":$359..$5D9
FrameTiles175:						; the raw tiles of frame $175 (FrameTileSource / FrameBankLayout entry
									; $175); pose not traced
	incbin "../Extracted/segments/bankC8_A000.bin":$5D9..$859
FrameTiles178:						; the raw tiles of frame $178 (FrameTileSource / FrameBankLayout entry
									; $178); pose not traced
	incbin "../Extracted/segments/bankC8_A000.bin":$859..$AB9
FrameTiles179:						; the raw tiles of frame $179 (FrameTileSource / FrameBankLayout entry
									; $179); pose not traced
	incbin "../Extracted/segments/bankC8_A000.bin":$AB9..$D19
FrameTiles17A:						; the raw tiles of frame $17A (FrameTileSource / FrameBankLayout entry
									; $17A); pose not traced
	incbin "../Extracted/segments/bankC8_A000.bin":$D19..$F19
FrameTiles17C:						; the raw tiles of frame $17C (FrameTileSource / FrameBankLayout entry
									; $17C); pose not traced
	incbin "../Extracted/segments/bankC8_A000.bin":$F19..$1000
	incbin "../Extracted/segments/bankC8_B000.bin":$0..$199

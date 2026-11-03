; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $C87019
FrameTiles151:						; the raw tiles of frame $151 (FrameTileSource / FrameBankLayout entry
									; $151); pose not traced
	incbin "../Extracted/segments/bankC8_7000.bin":$19..$279
FrameTiles152:						; the raw tiles of frame $152 (FrameTileSource / FrameBankLayout entry
									; $152); pose not traced
	incbin "../Extracted/segments/bankC8_7000.bin":$279..$4D9
FrameTiles154:						; the raw tiles of frame $154 (FrameTileSource / FrameBankLayout entry
									; $154); pose not traced
	incbin "../Extracted/segments/bankC8_7000.bin":$4D9..$719
FrameTiles155:						; the raw tiles of frame $155 (FrameTileSource / FrameBankLayout entry
									; $155); pose not traced
	incbin "../Extracted/segments/bankC8_7000.bin":$719..$959
FrameTiles158:						; the raw tiles of frame $158 (FrameTileSource / FrameBankLayout entry
									; $158); pose not traced
	incbin "../Extracted/segments/bankC8_7000.bin":$959..$BB9
FrameTiles159:						; the raw tiles of frame $159 (FrameTileSource / FrameBankLayout entry
									; $159); pose not traced
	incbin "../Extracted/segments/bankC8_7000.bin":$BB9..$E19
FrameTiles15A:						; the raw tiles of frame $15A (FrameTileSource / FrameBankLayout entry
									; $15A); pose not traced
	incbin "../Extracted/segments/bankC8_7000.bin":$E19..$1000
	incbin "../Extracted/segments/bankC8_8000.bin":$0..$19

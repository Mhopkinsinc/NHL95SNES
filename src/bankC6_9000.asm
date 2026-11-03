; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $C69088
FrameTiles047:						; the raw tiles of frame $047 (FrameTileSource / FrameBankLayout entry
									; $047); pose not traced
	incbin "../Extracted/segments/bankC6_9000.bin":$88..$288
FrameTiles048:						; the raw tiles of frame $048 (FrameTileSource / FrameBankLayout entry
									; $048); pose not traced
	incbin "../Extracted/segments/bankC6_9000.bin":$288..$488
FrameTiles049:						; the raw tiles of frame $049 (FrameTileSource / FrameBankLayout entry
									; $049); pose not traced
	incbin "../Extracted/segments/bankC6_9000.bin":$488..$688
FrameTiles04A:						; the raw tiles of frame $04A (FrameTileSource / FrameBankLayout entry
									; $04A); pose not traced
	incbin "../Extracted/segments/bankC6_9000.bin":$688..$888
FrameTiles04B:						; the raw tiles of frame $04B (FrameTileSource / FrameBankLayout entry
									; $04B); pose not traced
	incbin "../Extracted/segments/bankC6_9000.bin":$888..$A88
FrameTiles04C:						; the raw tiles of frame $04C (FrameTileSource / FrameBankLayout entry
									; $04C); pose not traced
	incbin "../Extracted/segments/bankC6_9000.bin":$A88..$CE8
FrameTiles04D:						; the raw tiles of frame $04D (FrameTileSource / FrameBankLayout entry
									; $04D); pose not traced
	incbin "../Extracted/segments/bankC6_9000.bin":$CE8..$F48
FrameTiles04E:						; the raw tiles of frame $04E (FrameTileSource / FrameBankLayout entry
									; $04E); pose not traced
	incbin "../Extracted/segments/bankC6_9000.bin":$F48..$1000
	incbin "../Extracted/segments/bankC6_A000.bin":$0..$1A8

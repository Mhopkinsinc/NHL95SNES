; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $C6A1A8
FrameTiles04F:						; the raw tiles of frame $04F (FrameTileSource / FrameBankLayout entry
									; $04F); pose not traced
	incbin "../Extracted/segments/bankC6_A000.bin":$1A8..$408
FrameTiles050:						; the raw tiles of frame $050 (FrameTileSource / FrameBankLayout entry
									; $050); pose not traced
	incbin "../Extracted/segments/bankC6_A000.bin":$408..$688
FrameTiles051:						; the raw tiles of frame $051 (FrameTileSource / FrameBankLayout entry
									; $051); pose not traced
	incbin "../Extracted/segments/bankC6_A000.bin":$688..$888
FrameTiles052:						; the raw tiles of frame $052 (FrameTileSource / FrameBankLayout entry
									; $052); pose not traced
	incbin "../Extracted/segments/bankC6_A000.bin":$888..$A88
FrameTiles053:						; the raw tiles of frame $053 (FrameTileSource / FrameBankLayout entry
									; $053); pose not traced
	incbin "../Extracted/segments/bankC6_A000.bin":$A88..$CA8
FrameTiles054:						; the raw tiles of frame $054 (FrameTileSource / FrameBankLayout entry
									; $054); pose not traced
	incbin "../Extracted/segments/bankC6_A000.bin":$CA8..$EC8
FrameTiles055:						; the raw tiles of frame $055 (FrameTileSource / FrameBankLayout entry
									; $055); pose not traced
	incbin "../Extracted/segments/bankC6_A000.bin":$EC8..$1000
	incbin "../Extracted/segments/bankC6_B000.bin":$0..$108

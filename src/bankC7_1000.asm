; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $C710BE
FrameTiles09D:						; the raw tiles of frame $09D (FrameTileSource / FrameBankLayout entry
									; $09D); pose not traced
	incbin "../Extracted/segments/bankC7_1000.bin":$BE..$2BE
FrameTiles09E:						; the raw tiles of frame $09E (FrameTileSource / FrameBankLayout entry
									; $09E); pose not traced
	incbin "../Extracted/segments/bankC7_1000.bin":$2BE..$4BE
FrameTiles09F:						; the raw tiles of frame $09F (FrameTileSource / FrameBankLayout entry
									; $09F); pose not traced
	incbin "../Extracted/segments/bankC7_1000.bin":$4BE..$6BE
FrameTiles0A0:						; the raw tiles of frame $0A0 (FrameTileSource / FrameBankLayout entry
									; $0A0); pose not traced
	incbin "../Extracted/segments/bankC7_1000.bin":$6BE..$8BE
FrameTiles0A1:						; the raw tiles of frame $0A1 (FrameTileSource / FrameBankLayout entry
									; $0A1); pose not traced
	incbin "../Extracted/segments/bankC7_1000.bin":$8BE..$ABE
FrameTiles0A2:						; the raw tiles of frame $0A2 (FrameTileSource / FrameBankLayout entry
									; $0A2); pose not traced
	incbin "../Extracted/segments/bankC7_1000.bin":$ABE..$D1E
FrameTiles0A3:						; the raw tiles of frame $0A3 (FrameTileSource / FrameBankLayout entry
									; $0A3); pose not traced
	incbin "../Extracted/segments/bankC7_1000.bin":$D1E..$F1E
FrameTiles0A4:						; the raw tiles of frame $0A4 (FrameTileSource / FrameBankLayout entry
									; $0A4); pose not traced
	incbin "../Extracted/segments/bankC7_1000.bin":$F1E..$1000
	incbin "../Extracted/segments/bankC7_2000.bin":$0..$19E

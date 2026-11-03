; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $C770FE
FrameTiles0C6:						; the raw tiles of frame $0C6 (FrameTileSource / FrameBankLayout entry
									; $0C6); pose not traced
	incbin "../Extracted/segments/bankC7_7000.bin":$FE..$37E
FrameTiles0C7:						; the raw tiles of frame $0C7 (FrameTileSource / FrameBankLayout entry
									; $0C7); pose not traced
	incbin "../Extracted/segments/bankC7_7000.bin":$37E..$5FE
FrameTiles0C8:						; the raw tiles of frame $0C8 (FrameTileSource / FrameBankLayout entry
									; $0C8); pose not traced
	incbin "../Extracted/segments/bankC7_7000.bin":$5FE..$87E
FrameTiles0C9:						; the raw tiles of frame $0C9 (FrameTileSource / FrameBankLayout entry
									; $0C9); pose not traced
	incbin "../Extracted/segments/bankC7_7000.bin":$87E..$AFE
FrameTiles0CA:						; the raw tiles of frame $0CA (FrameTileSource / FrameBankLayout entry
									; $0CA); pose not traced
	incbin "../Extracted/segments/bankC7_7000.bin":$AFE..$D1E
FrameTiles0CB:						; the raw tiles of frame $0CB (FrameTileSource / FrameBankLayout entry
									; $0CB); pose not traced
	incbin "../Extracted/segments/bankC7_7000.bin":$D1E..$F1E
FrameTiles0CC:						; the raw tiles of frame $0CC (FrameTileSource / FrameBankLayout entry
									; $0CC); pose not traced
	incbin "../Extracted/segments/bankC7_7000.bin":$F1E..$1000
	incbin "../Extracted/segments/bankC7_8000.bin":$0..$11E

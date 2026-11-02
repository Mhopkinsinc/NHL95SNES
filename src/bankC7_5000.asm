; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $C7513E
FrameTiles0B9:						; the raw tiles of frame $0B9 (FrameTileSource / FrameBankLayout entry
									; $0B9); pose not traced
	incbin "../Extracted/segments/bankC7_5000.bin":$13E..$39E
FrameTiles0BA:						; the raw tiles of frame $0BA (FrameTileSource / FrameBankLayout entry
									; $0BA); pose not traced
	incbin "../Extracted/segments/bankC7_5000.bin":$39E..$61E
FrameTiles0BB:						; the raw tiles of frame $0BB (FrameTileSource / FrameBankLayout entry
									; $0BB); pose not traced
	incbin "../Extracted/segments/bankC7_5000.bin":$61E..$87E
FrameTiles0BC:						; the raw tiles of frame $0BC (FrameTileSource / FrameBankLayout entry
									; $0BC); pose not traced
	incbin "../Extracted/segments/bankC7_5000.bin":$87E..$AFE
FrameTiles0BD:						; the raw tiles of frame $0BD (FrameTileSource / FrameBankLayout entry
									; $0BD); pose not traced
	incbin "../Extracted/segments/bankC7_5000.bin":$AFE..$D7E
FrameTiles0BE:						; the raw tiles of frame $0BE (FrameTileSource / FrameBankLayout entry
									; $0BE); pose not traced
	incbin "../Extracted/segments/bankC7_5000.bin":$D7E..$F9E
FrameTiles0BF:						; the raw tiles of frame $0BF (FrameTileSource / FrameBankLayout entry
									; $0BF); pose not traced
	incbin "../Extracted/segments/bankC7_5000.bin":$F9E..$1000
	incbin "../Extracted/segments/bankC7_6000.bin":$0..$21E

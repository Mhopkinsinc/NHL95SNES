; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $C7C0FE
FrameTiles0E7:						; the raw tiles of frame $0E7 (FrameTileSource / FrameBankLayout entry
									; $0E7); pose not traced
	incbin "../Extracted/segments/bankC7_C000.bin":$FE..$31E
FrameTiles0E8:						; the raw tiles of frame $0E8 (FrameTileSource / FrameBankLayout entry
									; $0E8); pose not traced
	incbin "../Extracted/segments/bankC7_C000.bin":$31E..$59E
FrameTiles0E9:						; the raw tiles of frame $0E9 (FrameTileSource / FrameBankLayout entry
									; $0E9); pose not traced
	incbin "../Extracted/segments/bankC7_C000.bin":$59E..$7FE
FrameTiles0EA:						; the raw tiles of frame $0EA (FrameTileSource / FrameBankLayout entry
									; $0EA); pose not traced
	incbin "../Extracted/segments/bankC7_C000.bin":$7FE..$A5E
FrameTiles0EB:						; the raw tiles of frame $0EB (FrameTileSource / FrameBankLayout entry
									; $0EB); pose not traced
	incbin "../Extracted/segments/bankC7_C000.bin":$A5E..$CDE
FrameTiles0EC:						; the raw tiles of frame $0EC (FrameTileSource / FrameBankLayout entry
									; $0EC); pose not traced
	incbin "../Extracted/segments/bankC7_C000.bin":$CDE..$F5E
FrameTiles0ED:						; the raw tiles of frame $0ED (FrameTileSource / FrameBankLayout entry
									; $0ED); pose not traced
	incbin "../Extracted/segments/bankC7_C000.bin":$F5E..$1000
	incbin "../Extracted/segments/bankC7_D000.bin":$0..$1DE

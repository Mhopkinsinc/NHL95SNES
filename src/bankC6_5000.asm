; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $C650C8
FrameTiles01E:						; the raw tiles of frame $01E (FrameTileSource / FrameBankLayout entry
									; $01E); pose not traced
	incbin "../Extracted/segments/bankC6_5000.bin":$C8..$328
FrameTiles01F:						; the raw tiles of frame $01F (FrameTileSource / FrameBankLayout entry
									; $01F); pose not traced
	incbin "../Extracted/segments/bankC6_5000.bin":$328..$528
FrameTiles020:						; the raw tiles of frame $020 (FrameTileSource / FrameBankLayout entry
									; $020); pose not traced
	incbin "../Extracted/segments/bankC6_5000.bin":$528..$728
FrameTiles022:						; the raw tiles of frame $022 (FrameTileSource / FrameBankLayout entry
									; $022); pose not traced
	incbin "../Extracted/segments/bankC6_5000.bin":$728..$988
FrameTiles023:						; the raw tiles of frame $023 (FrameTileSource / FrameBankLayout entry
									; $023); pose not traced
	incbin "../Extracted/segments/bankC6_5000.bin":$988..$B88
FrameTiles026:						; the raw tiles of frame $026 (FrameTileSource / FrameBankLayout entry
									; $026); pose not traced
	incbin "../Extracted/segments/bankC6_5000.bin":$B88..$D88
FrameTiles027:						; the raw tiles of frame $027 (FrameTileSource / FrameBankLayout entry
									; $027); pose not traced
	incbin "../Extracted/segments/bankC6_5000.bin":$D88..$F88
FrameTiles028:						; the raw tiles of frame $028 (FrameTileSource / FrameBankLayout entry
									; $028); pose not traced
	incbin "../Extracted/segments/bankC6_5000.bin":$F88..$1000
	incbin "../Extracted/segments/bankC6_6000.bin":$0..$188

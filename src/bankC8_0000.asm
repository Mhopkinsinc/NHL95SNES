; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $C80559
FrameTiles101:						; the raw tiles of frame $101 (FrameTileSource / FrameBankLayout entry
									; $101); pose not traced
	incbin "../Extracted/segments/bankC8_0000.bin":$559..$7D9
FrameTiles102:						; the raw tiles of frame $102 (FrameTileSource / FrameBankLayout entry
									; $102); pose not traced
	incbin "../Extracted/segments/bankC8_0000.bin":$7D9..$A59
FrameTiles103:						; the raw tiles of frame $103 (FrameTileSource / FrameBankLayout entry
									; $103); pose not traced
	incbin "../Extracted/segments/bankC8_0000.bin":$A59..$CD9
FrameTiles104:						; the raw tiles of frame $104 (FrameTileSource / FrameBankLayout entry
									; $104); pose not traced
	incbin "../Extracted/segments/bankC8_0000.bin":$CD9..$F59
FrameTiles105:						; the raw tiles of frame $105 (FrameTileSource / FrameBankLayout entry
									; $105); pose not traced
	incbin "../Extracted/segments/bankC8_0000.bin":$F59..$1000
	incbin "../Extracted/segments/bankC8_1000.bin":$0..$1B9

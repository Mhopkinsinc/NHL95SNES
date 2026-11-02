; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $CAE139
FrameTiles2C8:						; the raw tiles of frame $2C8 (FrameTileSource / FrameBankLayout entry
									; $2C8); pose not traced
	incbin "../Extracted/segments/bankCA_E000.bin":$139..$2B9
FrameTiles2C9:						; the raw tiles of frame $2C9 (FrameTileSource / FrameBankLayout entry
									; $2C9); pose not traced
	incbin "../Extracted/segments/bankCA_E000.bin":$2B9..$3B9
FrameTiles2CA:						; the raw tiles of frame $2CA (FrameTileSource / FrameBankLayout entry
									; $2CA); pose not traced
	incbin "../Extracted/segments/bankCA_E000.bin":$3B9..$4B9
FrameTiles2CB:						; the raw tiles of frame $2CB (FrameTileSource / FrameBankLayout entry
									; $2CB); pose not traced
	incbin "../Extracted/segments/bankCA_E000.bin":$4B9..$6B9
FrameTiles2CC:						; the raw tiles of frame $2CC (FrameTileSource / FrameBankLayout entry
									; $2CC); pose not traced
	incbin "../Extracted/segments/bankCA_E000.bin":$6B9..$939
FrameTiles2CD:						; the raw tiles of frame $2CD (FrameTileSource / FrameBankLayout entry
									; $2CD); pose not traced
	incbin "../Extracted/segments/bankCA_E000.bin":$939..$BB9
FrameTiles2CE:						; the raw tiles of frame $2CE (FrameTileSource / FrameBankLayout entry
									; $2CE); pose not traced
	incbin "../Extracted/segments/bankCA_E000.bin":$BB9..$E39
FrameTiles2CF:						; the raw tiles of frame $2CF (FrameTileSource / FrameBankLayout entry
									; $2CF); pose not traced
	incbin "../Extracted/segments/bankCA_E000.bin":$E39..$1000
	incbin "../Extracted/segments/bankCA_F000.bin":$0..$39

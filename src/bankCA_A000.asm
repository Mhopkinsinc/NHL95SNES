; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $CAA039
FrameTiles284:						; the raw tiles of frame $284 (FrameTileSource / FrameBankLayout entry
									; $284); pose not traced
	incbin "../Extracted/segments/bankCA_A000.bin":$39..$239
FrameTiles285:						; the raw tiles of frame $285 (FrameTileSource / FrameBankLayout entry
									; $285); pose not traced
	incbin "../Extracted/segments/bankCA_A000.bin":$239..$439
FrameTiles286:						; the raw tiles of frame $286 (FrameTileSource / FrameBankLayout entry
									; $286); pose not traced
	incbin "../Extracted/segments/bankCA_A000.bin":$439..$699
FrameTiles288:						; the raw tiles of frame $288 (FrameTileSource / FrameBankLayout entry
									; $288); pose not traced
	incbin "../Extracted/segments/bankCA_A000.bin":$699..$899
FrameTiles289:						; the raw tiles of frame $289 (FrameTileSource / FrameBankLayout entry
									; $289); pose not traced
	incbin "../Extracted/segments/bankCA_A000.bin":$899..$AF9
FrameTiles28B:						; the raw tiles of frame $28B (FrameTileSource / FrameBankLayout entry
									; $28B); pose not traced
	incbin "../Extracted/segments/bankCA_A000.bin":$AF9..$D59
FrameTiles28C:						; the raw tiles of frame $28C (FrameTileSource / FrameBankLayout entry
									; $28C); pose not traced
	incbin "../Extracted/segments/bankCA_A000.bin":$D59..$FB9
FrameTiles28E:						; the raw tiles of frame $28E (FrameTileSource / FrameBankLayout entry
									; $28E); pose not traced
	incbin "../Extracted/segments/bankCA_A000.bin":$FB9..$1000
	incbin "../Extracted/segments/bankCA_B000.bin":$0..$219

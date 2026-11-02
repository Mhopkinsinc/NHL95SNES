; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $CA6139
FrameTiles267:						; the raw tiles of frame $267 (FrameTileSource / FrameBankLayout entry
									; $267); pose not traced
	incbin "../Extracted/segments/bankCA_6000.bin":$139..$339
FrameTiles268:						; the raw tiles of frame $268 (FrameTileSource / FrameBankLayout entry
									; $268); pose not traced
	incbin "../Extracted/segments/bankCA_6000.bin":$339..$539
FrameTiles269:						; the raw tiles of frame $269 (FrameTileSource / FrameBankLayout entry
									; $269); pose not traced
	incbin "../Extracted/segments/bankCA_6000.bin":$539..$739
FrameTiles26A:						; the raw tiles of frame $26A (FrameTileSource / FrameBankLayout entry
									; $26A); pose not traced
	incbin "../Extracted/segments/bankCA_6000.bin":$739..$939
FrameTiles26B:						; the raw tiles of frame $26B (FrameTileSource / FrameBankLayout entry
									; $26B); pose not traced
	incbin "../Extracted/segments/bankCA_6000.bin":$939..$B39
FrameTiles26C:						; the raw tiles of frame $26C (FrameTileSource / FrameBankLayout entry
									; $26C); pose not traced
	incbin "../Extracted/segments/bankCA_6000.bin":$B39..$D39
FrameTiles26D:						; the raw tiles of frame $26D (FrameTileSource / FrameBankLayout entry
									; $26D); pose not traced
	incbin "../Extracted/segments/bankCA_6000.bin":$D39..$F39
FrameTiles26E:						; the raw tiles of frame $26E (FrameTileSource / FrameBankLayout entry
									; $26E); pose not traced
	incbin "../Extracted/segments/bankCA_6000.bin":$F39..$1000
	incbin "../Extracted/segments/bankCA_7000.bin":$0..$199

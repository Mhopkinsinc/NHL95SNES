; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $CAD0D9
FrameTiles2A2:						; the raw tiles of frame $2A2 (FrameTileSource / FrameBankLayout entry
									; $2A2); pose not traced
	incbin "../Extracted/segments/bankCA_D000.bin":$D9..$339
FrameTiles2A3:						; the raw tiles of frame $2A3 (FrameTileSource / FrameBankLayout entry
									; $2A3); pose not traced
	incbin "../Extracted/segments/bankCA_D000.bin":$339..$539
FrameTiles2A4:						; the raw tiles of frame $2A4 (FrameTileSource / FrameBankLayout entry
									; $2A4); pose not traced
	incbin "../Extracted/segments/bankCA_D000.bin":$539..$739
FrameTiles2BD:						; the raw tiles of frame $2BD (FrameTileSource / FrameBankLayout entry
									; $2BD); pose not traced
	incbin "../Extracted/segments/bankCA_D000.bin":$739..$7B9
FrameTiles2BE:						; the raw tiles of frame $2BE (FrameTileSource / FrameBankLayout entry
									; $2BE); pose not traced
	incbin "../Extracted/segments/bankCA_D000.bin":$7B9..$839
FrameTiles2BF:						; the raw tiles of frame $2BF (FrameTileSource / FrameBankLayout entry
									; $2BF); pose not traced
	incbin "../Extracted/segments/bankCA_D000.bin":$839..$8B9
FrameTiles2C0:						; the raw tiles of frame $2C0 (FrameTileSource / FrameBankLayout entry
									; $2C0); pose not traced
	incbin "../Extracted/segments/bankCA_D000.bin":$8B9..$A39
FrameTiles2C1:						; the raw tiles of frame $2C1 (FrameTileSource / FrameBankLayout entry
									; $2C1); pose not traced
	incbin "../Extracted/segments/bankCA_D000.bin":$A39..$AB9
FrameTiles2C2:						; the raw tiles of frame $2C2 (FrameTileSource / FrameBankLayout entry
									; $2C2); pose not traced
	incbin "../Extracted/segments/bankCA_D000.bin":$AB9..$B39
FrameTiles2C3:						; the raw tiles of frame $2C3 (FrameTileSource / FrameBankLayout entry
									; $2C3); pose not traced
	incbin "../Extracted/segments/bankCA_D000.bin":$B39..$BB9
FrameTiles2C4:						; the raw tiles of frame $2C4 (FrameTileSource / FrameBankLayout entry
									; $2C4); pose not traced
	incbin "../Extracted/segments/bankCA_D000.bin":$BB9..$CB9
FrameTiles2C5:						; the raw tiles of frame $2C5 (FrameTileSource / FrameBankLayout entry
									; $2C5); pose not traced
	incbin "../Extracted/segments/bankCA_D000.bin":$CB9..$E39
FrameTiles2C6:						; the raw tiles of frame $2C6 (FrameTileSource / FrameBankLayout entry
									; $2C6); pose not traced
	incbin "../Extracted/segments/bankCA_D000.bin":$E39..$FB9
FrameTiles2C7:						; the raw tiles of frame $2C7 (FrameTileSource / FrameBankLayout entry
									; $2C7); pose not traced
	incbin "../Extracted/segments/bankCA_D000.bin":$FB9..$1000
	incbin "../Extracted/segments/bankCA_E000.bin":$0..$139

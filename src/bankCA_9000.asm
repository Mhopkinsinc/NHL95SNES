; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $CA90B9
FrameTiles27D:						; the raw tiles of frame $27D (FrameTileSource / FrameBankLayout entry
									; $27D); pose not traced
	incbin "../Extracted/segments/bankCA_9000.bin":$B9..$319
FrameTiles27E:						; the raw tiles of frame $27E (FrameTileSource / FrameBankLayout entry
									; $27E); pose not traced
	incbin "../Extracted/segments/bankCA_9000.bin":$319..$519
FrameTiles27F:						; the raw tiles of frame $27F (FrameTileSource / FrameBankLayout entry
									; $27F); pose not traced
	incbin "../Extracted/segments/bankCA_9000.bin":$519..$779
FrameTiles280:						; the raw tiles of frame $280 (FrameTileSource / FrameBankLayout entry
									; $280); pose not traced
	incbin "../Extracted/segments/bankCA_9000.bin":$779..$9D9
FrameTiles281:						; the raw tiles of frame $281 (FrameTileSource / FrameBankLayout entry
									; $281); pose not traced
	incbin "../Extracted/segments/bankCA_9000.bin":$9D9..$BD9
FrameTiles282:						; the raw tiles of frame $282 (FrameTileSource / FrameBankLayout entry
									; $282); pose not traced
	incbin "../Extracted/segments/bankCA_9000.bin":$BD9..$DD9
FrameTiles283:						; the raw tiles of frame $283 (FrameTileSource / FrameBankLayout entry
									; $283); pose not traced
	incbin "../Extracted/segments/bankCA_9000.bin":$DD9..$1000
	incbin "../Extracted/segments/bankCA_A000.bin":$0..$39

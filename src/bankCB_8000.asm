; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $CB81F5
FrameTiles341:						; the raw tiles of frame $341 (FrameTileSource / FrameBankLayout entry
									; $341); pose not traced
	incbin "../Extracted/segments/bankCB_8000.bin":$1F5..$3F5
FrameTiles342:						; the raw tiles of frame $342 (FrameTileSource / FrameBankLayout entry
									; $342); pose not traced
	incbin "../Extracted/segments/bankCB_8000.bin":$3F5..$5F5
FrameTiles343:						; the raw tiles of frame $343 (FrameTileSource / FrameBankLayout entry
									; $343); pose not traced
	incbin "../Extracted/segments/bankCB_8000.bin":$5F5..$7F5
FrameTiles344:						; the raw tiles of frame $344 (FrameTileSource / FrameBankLayout entry
									; $344); pose not traced
	incbin "../Extracted/segments/bankCB_8000.bin":$7F5..$9F5
FrameTiles345:						; the raw tiles of frame $345 (FrameTileSource / FrameBankLayout entry
									; $345); pose not traced
	incbin "../Extracted/segments/bankCB_8000.bin":$9F5..$BF5
FrameTiles346:						; the raw tiles of frame $346 (FrameTileSource / FrameBankLayout entry
									; $346); pose not traced
	incbin "../Extracted/segments/bankCB_8000.bin":$BF5..$E55
FrameTiles347:						; the raw tiles of frame $347 (FrameTileSource / FrameBankLayout entry
									; $347); pose not traced
	incbin "../Extracted/segments/bankCB_8000.bin":$E55..$1000
	incbin "../Extracted/segments/bankCB_9000.bin":$0..$D5

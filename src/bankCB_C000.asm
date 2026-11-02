; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $CBC035
FrameTiles35D:						; the raw tiles of frame $35D (FrameTileSource / FrameBankLayout entry
									; $35D); pose not traced
	incbin "../Extracted/segments/bankCB_C000.bin":$35..$235
FrameTiles35E:						; the raw tiles of frame $35E (FrameTileSource / FrameBankLayout entry
									; $35E); pose not traced
	incbin "../Extracted/segments/bankCB_C000.bin":$235..$435
FrameTiles35F:						; the raw tiles of frame $35F (FrameTileSource / FrameBankLayout entry
									; $35F); pose not traced
	incbin "../Extracted/segments/bankCB_C000.bin":$435..$635
FrameTiles360:						; the raw tiles of frame $360 (FrameTileSource / FrameBankLayout entry
									; $360); pose not traced
	incbin "../Extracted/segments/bankCB_C000.bin":$635..$835
FrameTiles361:						; the raw tiles of frame $361 (FrameTileSource / FrameBankLayout entry
									; $361); pose not traced
	incbin "../Extracted/segments/bankCB_C000.bin":$835..$A35
FrameTiles362:						; the raw tiles of frame $362 (FrameTileSource / FrameBankLayout entry
									; $362); pose not traced
	incbin "../Extracted/segments/bankCB_C000.bin":$A35..$C35
FrameTiles363:						; the raw tiles of frame $363 (FrameTileSource / FrameBankLayout entry
									; $363); pose not traced
	incbin "../Extracted/segments/bankCB_C000.bin":$C35..$E35
FrameTiles364:						; the raw tiles of frame $364 (FrameTileSource / FrameBankLayout entry
									; $364); pose not traced
	incbin "../Extracted/segments/bankCB_C000.bin":$E35..$1000
	incbin "../Extracted/segments/bankCB_D000.bin":$0..$35

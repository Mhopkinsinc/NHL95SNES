; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $C89079
FrameTiles168:						; the raw tiles of frame $168 (FrameTileSource / FrameBankLayout entry
									; $168); pose not traced
	incbin "../Extracted/segments/bankC8_9000.bin":$79..$2D9
FrameTiles169:						; the raw tiles of frame $169 (FrameTileSource / FrameBankLayout entry
									; $169); pose not traced
	incbin "../Extracted/segments/bankC8_9000.bin":$2D9..$539
FrameTiles16A:						; the raw tiles of frame $16A (FrameTileSource / FrameBankLayout entry
									; $16A); pose not traced
	incbin "../Extracted/segments/bankC8_9000.bin":$539..$779
FrameTiles16C:						; the raw tiles of frame $16C (FrameTileSource / FrameBankLayout entry
									; $16C); pose not traced
	incbin "../Extracted/segments/bankC8_9000.bin":$779..$9D9
FrameTiles16D:						; the raw tiles of frame $16D (FrameTileSource / FrameBankLayout entry
									; $16D); pose not traced
	incbin "../Extracted/segments/bankC8_9000.bin":$9D9..$C39
FrameTiles170:						; the raw tiles of frame $170 (FrameTileSource / FrameBankLayout entry
									; $170); pose not traced
	incbin "../Extracted/segments/bankC8_9000.bin":$C39..$E99
FrameTiles171:						; the raw tiles of frame $171 (FrameTileSource / FrameBankLayout entry
									; $171); pose not traced
	incbin "../Extracted/segments/bankC8_9000.bin":$E99..$1000
	incbin "../Extracted/segments/bankC8_A000.bin":$0..$F9

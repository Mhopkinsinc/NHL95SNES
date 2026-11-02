; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $C9800B
FrameTiles20C:						; the raw tiles of frame $20C (FrameTileSource / FrameBankLayout entry
									; $20C); pose not traced
	incbin "../Extracted/segments/bankC9_8000.bin":$B..$26B
FrameTiles20D:						; the raw tiles of frame $20D (FrameTileSource / FrameBankLayout entry
									; $20D); pose not traced
	incbin "../Extracted/segments/bankC9_8000.bin":$26B..$4CB
FrameTiles20E:						; the raw tiles of frame $20E (FrameTileSource / FrameBankLayout entry
									; $20E); pose not traced
	incbin "../Extracted/segments/bankC9_8000.bin":$4CB..$72B
FrameTiles20F:						; the raw tiles of frame $20F (FrameTileSource / FrameBankLayout entry
									; $20F); pose not traced
	incbin "../Extracted/segments/bankC9_8000.bin":$72B..$98B
FrameTiles210:						; the raw tiles of frame $210 (FrameTileSource / FrameBankLayout entry
									; $210); pose not traced
	incbin "../Extracted/segments/bankC9_8000.bin":$98B..$BEB
FrameTiles211:						; the raw tiles of frame $211 (FrameTileSource / FrameBankLayout entry
									; $211); pose not traced
	incbin "../Extracted/segments/bankC9_8000.bin":$BEB..$E4B
FrameTiles212:						; the raw tiles of frame $212 (FrameTileSource / FrameBankLayout entry
									; $212); pose not traced
	incbin "../Extracted/segments/bankC9_8000.bin":$E4B..$1000
	incbin "../Extracted/segments/bankC9_9000.bin":$0..$AB

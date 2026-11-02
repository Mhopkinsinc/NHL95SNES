; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $CB4075
FrameTiles2EF:						; the raw tiles of frame $2EF (FrameTileSource / FrameBankLayout entry
									; $2EF); pose not traced
	incbin "../Extracted/segments/bankCB_4000.bin":$75..$275
FrameTiles2F0:						; the raw tiles of frame $2F0 (FrameTileSource / FrameBankLayout entry
									; $2F0); pose not traced
	incbin "../Extracted/segments/bankCB_4000.bin":$275..$4D5
FrameTiles2F1:						; the raw tiles of frame $2F1 (FrameTileSource / FrameBankLayout entry
									; $2F1); pose not traced
	incbin "../Extracted/segments/bankCB_4000.bin":$4D5..$6D5
FrameTiles2F2:						; the raw tiles of frame $2F2 (FrameTileSource / FrameBankLayout entry
									; $2F2); pose not traced
	incbin "../Extracted/segments/bankCB_4000.bin":$6D5..$935
FrameTiles312:						; the raw tiles of frame $312 (FrameTileSource / FrameBankLayout entry
									; $312); pose not traced
	incbin "../Extracted/segments/bankCB_4000.bin":$935..$BB5
FrameTiles319:						; the raw tiles of frame $319 (FrameTileSource / FrameBankLayout entry
									; $319); pose not traced
	incbin "../Extracted/segments/bankCB_4000.bin":$BB5..$DB5
FrameTiles32A:						; the raw tiles of frame $32A (FrameTileSource / FrameBankLayout entry
									; $32A); pose not traced
	incbin "../Extracted/segments/bankCB_4000.bin":$DB5..$1000
	incbin "../Extracted/segments/bankCB_5000.bin":$0..$15

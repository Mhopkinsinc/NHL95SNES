; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $C9B10B
FrameTiles220:						; the raw tiles of frame $220 (FrameTileSource / FrameBankLayout entry
									; $220); pose not traced
	incbin "../Extracted/segments/bankC9_B000.bin":$10B..$38B
FrameTiles221:						; the raw tiles of frame $221 (FrameTileSource / FrameBankLayout entry
									; $221); pose not traced
	incbin "../Extracted/segments/bankC9_B000.bin":$38B..$5EB
FrameTiles222:						; the raw tiles of frame $222 (FrameTileSource / FrameBankLayout entry
									; $222); pose not traced
	incbin "../Extracted/segments/bankC9_B000.bin":$5EB..$84B
FrameTiles223:						; the raw tiles of frame $223 (FrameTileSource / FrameBankLayout entry
									; $223); pose not traced
	incbin "../Extracted/segments/bankC9_B000.bin":$84B..$AAB
FrameTiles224:						; the raw tiles of frame $224 (FrameTileSource / FrameBankLayout entry
									; $224); pose not traced
	incbin "../Extracted/segments/bankC9_B000.bin":$AAB..$D2B
FrameTiles225:						; the raw tiles of frame $225 (FrameTileSource / FrameBankLayout entry
									; $225); pose not traced
	incbin "../Extracted/segments/bankC9_B000.bin":$D2B..$F8B
FrameTiles226:						; the raw tiles of frame $226 (FrameTileSource / FrameBankLayout entry
									; $226); pose not traced
	incbin "../Extracted/segments/bankC9_B000.bin":$F8B..$1000
	incbin "../Extracted/segments/bankC9_C000.bin":$0..$18B
